package dev.mvc.artist;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.album.AlbumProcInter;
import dev.mvc.album.AlbumVO;
import dev.mvc.music.MusicProcInter;
import dev.mvc.music.Music_Album_Artist_VO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;
import dev.mvc.video.VideoProcInter;
import dev.mvc.video.VideoVO;


@Controller
public class ArtistCont {
  @Autowired
  @Qualifier("dev.mvc.artist.ArtistProc")
  private ArtistProcInter artistProc;
  
  @Autowired
  @Qualifier("dev.mvc.album.AlbumProc")
  private AlbumProcInter albumProc;
  
  @Autowired
  @Qualifier("dev.mvc.music.MusicProc")
  private MusicProcInter musicProc;
  
  @Autowired
  @Qualifier("dev.mvc.video.VideoProc")
  private VideoProcInter videoProc;
  
  public ArtistCont(){
    System.out.println("--> ArtistCont created.");
  }
  
  // http://localhost:9090/team2/artist/create.do
  /**
   * ��� ��
   * @return
   */
  @RequestMapping(value = "/artist/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/artist/create"); // webapp/categrp/create.jsp

    return mav;
  }
  
  /**
   * ���� ���
   * @param request
   * @param artistVO
   * @return
   */
  @RequestMapping(value = "/artist/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request,
                                       ArtistVO artistVO) {
    
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    String fname = ""; // ���� ���ϸ�
    String fupname = ""; // ���ε�� ���ϸ�
    long fsize = 0;  // ���� ������
    String thumbnail = ""; // Preview �̹���
    int upload_count = 0; // ����ó���� ���ڵ� ����
    
    String upDir = Tool.getRealPath(request, "/artist/storage"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    List<MultipartFile> fnamesMF = artistVO.getFnamesMF();
    int count = fnamesMF.size(); // ���� ���� ����
    if (count > 0) { // ������ ������ �ִٸ�
      for (MultipartFile multipartFile:fnamesMF) { // ���� ����
        fsize = multipartFile.getSize();  // ���� ũ��
        if (fsize > 0) { // ���� ũ�� üũ
          fname = multipartFile.getOriginalFilename(); // ���� ���ϸ�
          // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�. spring.jsp, spring_1.jpg...
          fupname = Upload.saveFileSpring(multipartFile, upDir);
          
          if (Tool.isImage(fname)) { // �̹������� �˻�
            // thumb �̹��� ����, width: 120, height: 80
            thumbnail = Tool.preview(upDir, fupname, 120, 80);
          }
        }
        ArtistVO vo = new ArtistVO();
        vo.setDebut(artistVO.getDebut());
        vo.setGenre(artistVO.getGenre());
        vo.setName(artistVO.getName());
        vo.setNation(artistVO.getNation());
        vo.setSeqno(artistVO.getSeqno());
        vo.setType(artistVO.getType());
        vo.setFname(fname);
        vo.setFupname(fupname);
        vo.setThumbnail(thumbnail);
        vo.setFsize(fsize);
        
        upload_count = upload_count + this.artistProc.create(vo); // ���� 1�� ��� ���� dbms ����
      }
    }    
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    
    mav.addObject("upload_count", upload_count);    
    mav.addObject("artist_name", artistVO.getName());
    // mav.addObject("cateno", cateno);   
    
    // ra.addAttribute("upload_count", upload_count);
    // ra.addAttribute("categrpno", categrpno);
    // ra.addAttribute("contentsno", attachfileVO.getContentsno());
    
    mav.setViewName("redirect:/artist/create_msg.jsp");
    return mav;
  }
  
  // http://localhost:9090/team2/artist/list.do
  /**
   * ��ü ���
   * @return 
   */
  @RequestMapping(value = "/artist/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<ArtistVO> list = this.artistProc.list();
    mav.addObject("list", list);

    mav.setViewName("/artist/list"); // webapp/categrp/list.jsp
    return mav;

  }
  

  // http://localhost:9090/team2/artist/read.do?artistno=3
  /**
   * ��ȸ
   * @return
   */
  @RequestMapping(value="/artist/read.do", method=RequestMethod.GET)
  public ModelAndView read(int artistno) {
    ModelAndView mav = new ModelAndView();
    
    ArtistVO artistVO = this.artistProc.read(artistno);
    mav.addObject("artistVO", artistVO);
    
    List<AlbumVO> albumlist = this.albumProc.read_artist(artistno);
    mav.addObject("albumlist", albumlist);
    
    List<Music_Album_Artist_VO> musiclist = this.musicProc.artist_read(artistno);
    mav.addObject("musiclist", musiclist);
    
    List<VideoVO> videolist = this.videoProc.read_artistno(artistno);
    mav.addObject("videolist", videolist);
    
    mav.setViewName("/artist/read"); // webapp/categrp/list.jsp
    return mav;
    
  }
  
  // http://localhost:9090/team2/artist/update_form.do
  /**
   * ���� ���
   * @return 
   */
  @RequestMapping(value = "/artist/update_form.do", method = RequestMethod.GET)
  public ModelAndView update_form() {
    ModelAndView mav = new ModelAndView();

    List<ArtistVO> list = this.artistProc.list();
    mav.addObject("list", list);

    mav.setViewName("/artist/list_update"); // webapp/categrp/list.jsp
    return mav;

  }
  
  // http://localhost:9090/team2/artist/update.do?artistno=3
  /**
   * ������
   * @param artistno ��ȸ�� ī�װ� ��ȣ
   * @return 
   */
 @RequestMapping(value="/artist/update.do", method=RequestMethod.GET) 
 public ModelAndView update_get(int artistno) {
   ModelAndView mav = new ModelAndView();
   
   ArtistVO artistVO = this.artistProc.read(artistno);
   mav.addObject("artistVO", artistVO); // request ��ü�� ����
   
   mav.setViewName("/artist/update"); // webapp/categrp/list.jsp
   return mav; // Forward
 }
 
 /**
 * ���� ����
 * @param request
 * @param artistVO
 * @return
 */
@RequestMapping(value = "/artist/update.do", method = RequestMethod.POST)
public ModelAndView update_post(HttpServletRequest request,
                                     ArtistVO artistVO) {
  
  ModelAndView mav = new ModelAndView();
  // -----------------------------------------------------
  // ���� ���� �ڵ� ����
  // -----------------------------------------------------
  String fname = ""; // ���� ���ϸ�
  String fupname = ""; // ���ε�� ���ϸ�
  long fsize = 0;  // ���� ������
  String thumbnail = ""; // Preview �̹���
  int upload_count = 0; // ����ó���� ���ڵ� ����
  
  String upDir = Tool.getRealPath(request, "/artist/storage"); // ���� ���
  // ���� ������ ����� fnamesMF ��ü�� ������.
  List<MultipartFile> fnamesMF = artistVO.getFnamesMF();
  int count = fnamesMF.size(); // ���� ���� ����
  if (count > 0) { // ������ ������ �ִٸ�
    for (MultipartFile multipartFile:fnamesMF) { // ���� ����
      fsize = multipartFile.getSize();  // ���� ũ��
      if (fsize > 0) { // ���� ũ�� üũ
        fname = multipartFile.getOriginalFilename(); // ���� ���ϸ�
        // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�. spring.jsp, spring_1.jpg...
        fupname = Upload.saveFileSpring(multipartFile, upDir);
        
        if (Tool.isImage(fname)) { // �̹������� �˻�
          // thumb �̹��� ����, width: 120, height: 80
          thumbnail = Tool.preview(upDir, fupname, 120, 80);
        }
      }
      ArtistVO vo = new ArtistVO();
      vo.setDebut(artistVO.getDebut());
      vo.setGenre(artistVO.getGenre());
      vo.setName(artistVO.getName());
      vo.setNation(artistVO.getNation());
      vo.setSeqno(artistVO.getSeqno());
      vo.setType(artistVO.getType());
      vo.setArtistno(artistVO.getArtistno());
      vo.setFname(fname);
      vo.setFupname(fupname);
      vo.setThumbnail(thumbnail);
      vo.setFsize(fsize);
      
      upload_count = this.artistProc.update(vo); // ���� 1�� ��� ���� dbms ����
    }
  }    
  // -----------------------------------------------------
  // ���� ���� �ڵ� ����
  // -----------------------------------------------------
  
  mav.addObject("upload_count", upload_count);    
  mav.addObject("artist_name", artistVO.getName());
  // mav.addObject("cateno", cateno);   
  
  // ra.addAttribute("upload_count", upload_count);
  // ra.addAttribute("categrpno", categrpno);
  // ra.addAttribute("contentsno", attachfileVO.getContentsno());
  
  mav.setViewName("redirect:/artist/update_msg.jsp");
  return mav;
}

// http://localhost:9090/team2/artist/delete_form.do
/**
 * ���� ���
 * @return 
 */
@RequestMapping(value = "/artist/delete_form.do", method = RequestMethod.GET)
public ModelAndView delete_form() {
  ModelAndView mav = new ModelAndView();

  List<ArtistVO> list = this.artistProc.list();
  mav.addObject("list", list);

  mav.setViewName("/artist/list_delete"); // webapp/categrp/list.jsp
  return mav;

}

// http://localhost:9090/team2/artist/delete_form.do
/**
* ���� ���
* @return 
*/
@RequestMapping(value = "/artist/create_album_form.do", method = RequestMethod.GET)
public ModelAndView create_album_form() {
  ModelAndView mav = new ModelAndView();

  List<ArtistVO> list = this.artistProc.list();
  mav.addObject("list", list);

  mav.setViewName("/artist/list_create_album"); // webapp/categrp/list.jsp
  return mav;

}

/**
 * ÷�� ���� 1�� ���� ó��
 * 
 * @param artistno
 * @return
 */
@RequestMapping(value = "/artist/delete.do", 
                           method = RequestMethod.GET)
public ModelAndView file_delete_proc(HttpServletRequest request,
                                                  int artistno) {
  ModelAndView mav = new ModelAndView();

  // ������ ���� ������ �о��.
  ArtistVO artistVO = artistProc.read(artistno);
  
  String upDir = Tool.getRealPath(request, "/artist/storage"); // ���� ���
  Tool.deleteFile(upDir, artistVO.getFupname()); // Folder���� 1���� ���� ����
  Tool.deleteFile(upDir, artistVO.getThumbnail()); // 1���� Thumb ���� ����
  
  // DBMS���� 1���� ���� ����
  artistProc.delete(artistno);
      
  List<ArtistVO> artist_list = artistProc.list();
  mav.addObject("artist_list", artist_list);
  
  mav.setViewName("redirect:/artist/list.do"); // file_delete.jsp

  return mav;
}

}
