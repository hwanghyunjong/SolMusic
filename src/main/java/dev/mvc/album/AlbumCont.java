package dev.mvc.album;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.artist.*;
import dev.mvc.music.MusicProcInter;
import dev.mvc.music.MusicVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;
import dev.mvc.video.VideoProcInter;
import dev.mvc.video.VideoVO;


@Controller
public class AlbumCont {
  @Autowired
  @Qualifier("dev.mvc.album.AlbumProc")
  private AlbumProcInter albumProc;
  
  @Autowired
  @Qualifier("dev.mvc.artist.ArtistProc")
  private ArtistProcInter artistProc;
  
  @Autowired
  @Qualifier("dev.mvc.music.MusicProc")
  private MusicProcInter musicProc;
  
  @Autowired
  @Qualifier("dev.mvc.video.VideoProc")
  private VideoProcInter videoProc;
  
  public AlbumCont(){
    System.out.println("--> AlbumCont created.");
  }
  
  // http://localhost:9090/team2/album/create.do?artistno=1
  /**
   * ��� ��
   * @return
   */
  @RequestMapping(value = "/album/create.do", method = RequestMethod.GET)
  public ModelAndView create(int artistno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/album/create"); // webapp/categrp/create.jsp

    return mav;
  }
  
  // http://localhost:9090/team2/album/create.do
  /**
   * ��� ����
   * @param request
   * @param albumVO
   * @return
   */
  @RequestMapping(value = "/album/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request,
                                       AlbumVO albumVO) {
    
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    String fname = ""; // ���� ���ϸ�
    String fupname = ""; // ���ε�� ���ϸ�
    long fsize = 0;  // ���� ������
    String thumbnail = ""; // Preview �̹���
    int upload_count = 0; // ����ó���� ���ڵ� ����
    
    String upDir = Tool.getRealPath(request, "/album/storage"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    List<MultipartFile> fnamesMF = albumVO.getFnamesMF();
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
        AlbumVO vo = new AlbumVO();
        vo.setTitle(albumVO.getTitle());
        vo.setKind(albumVO.getKind());
        vo.setRelease(albumVO.getRelease());
        vo.setGenre(albumVO.getGenre());
        vo.setEnter(albumVO.getEnter());
        vo.setIntro(albumVO.getIntro());
        vo.setDetail(albumVO.getDetail());
        vo.setArtistno(albumVO.getArtistno());
        vo.setFname(fname);
        vo.setFupname(fupname);
        vo.setThumbnail(thumbnail);
        vo.setFsize(fsize);
        
        upload_count = upload_count + this.albumProc.create(vo); // ���� 1�� ��� ���� dbms ����
      }
    }    
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    
    mav.addObject("upload_count", upload_count);    
    mav.addObject("album_name", albumVO.getTitle());
    
    mav.setViewName("redirect:/album/create_msg.jsp");
    return mav;
  }
  
  // http://localhost:9090/team2/album/list.do
  /**
   * ��ü ���
   * @return
   */
  @RequestMapping(value="/album/list.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<Artist_Album_VO> list = this.albumProc.list_join();
    mav.addObject("list", list);

    mav.setViewName("/album/list"); // webapp/categrp/list.jsp
    return mav;

  }
  
  // http://localhost:9090/team2/album/delete_form.do
  /**
  * �뷡 ���� �� ���
  * @return 
  */
  @RequestMapping(value = "/album/list_create_music.do", method = RequestMethod.GET)
  public ModelAndView create_music_form() {
   ModelAndView mav = new ModelAndView();
  
   List<Artist_Album_VO> list = this.albumProc.list_join();
   mav.addObject("list", list);
  
   mav.setViewName("/album/list_create_music"); // webapp/categrp/list.jsp
   return mav;
  
  }

  // http://localhost:9090/team2/album/read.do?albumno=3
  /**
   * ��ȸ
   * @return
   */
  @RequestMapping(value="/album/read.do", method=RequestMethod.GET)
  public ModelAndView read(int albumno) {
    ModelAndView mav = new ModelAndView();
    
    AlbumVO albumVO = this.albumProc.read(albumno);
    mav.addObject("albumVO", albumVO);
    
    ArtistVO artistVO = this.artistProc.read(albumVO.getArtistno());
    mav.addObject("artistVO", artistVO);
    
    List<MusicVO> musicVO = this.musicProc.read_albumno(albumno);
    mav.addObject("musicList", musicVO);
    
    List<VideoVO> videoVO = this.videoProc.read_albumno(albumno);
    mav.addObject("videoList", videoVO);
    
    int testno = 0;
    mav.addObject("testno", testno);
   
    mav.setViewName("/album/read"); // webapp/categrp/list.jsp
    return mav;
    
  }
  
  // http://localhost:9090/team2/album/update_form.do
  /**
   * ���� ���
   * @return 
   */
  @RequestMapping(value = "/album/update_form.do", method = RequestMethod.GET)
  public ModelAndView update_form() {
    ModelAndView mav = new ModelAndView();

    List<Artist_Album_VO> list = this.albumProc.list_join();
    mav.addObject("list", list);

    mav.setViewName("/album/list_update"); // webapp/categrp/list.jsp
    return mav;

  }
  
  // http://localhost:9090/team2/album/update.do?artistno=3
  /**
   * ������
   * @param artistno ��ȸ�� ī�װ� ��ȣ
   * @return 
   */
   @RequestMapping(value="/album/update.do", method=RequestMethod.GET) 
   public ModelAndView update_get(int albumno) {
     ModelAndView mav = new ModelAndView();
     
     AlbumVO albumVO = this.albumProc.read_update(albumno);
     mav.addObject("albumVO", albumVO); // request ��ü�� ����
     
     mav.setViewName("/album/update"); // webapp/categrp/list.jsp
     return mav; // Forward
   }
   
   /**
    * ���� ����
    * @param request
    * @param artistVO
    * @return
    */
   @RequestMapping(value = "/album/update.do", method = RequestMethod.POST)
   public ModelAndView update_post(HttpServletRequest request,
                                        AlbumVO albumVO) {
     
     ModelAndView mav = new ModelAndView();
     // -----------------------------------------------------
     // ���� ���� �ڵ� ����
     // -----------------------------------------------------
     String fname = ""; // ���� ���ϸ�
     String fupname = ""; // ���ε�� ���ϸ�
     long fsize = 0;  // ���� ������
     String thumbnail = ""; // Preview �̹���
     int upload_count = 0; // ����ó���� ���ڵ� ����
     
     String upDir = Tool.getRealPath(request, "/album/storage"); // ���� ���
     // ���� ������ ����� fnamesMF ��ü�� ������.
     List<MultipartFile> fnamesMF = albumVO.getFnamesMF();
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
//         HashMap<String, Object> hashMap = new HashMap<String, Object>();
//         hashMap.put("albun", value)
         
         AlbumVO vo = new AlbumVO();
         vo.setAlbumno(albumVO.getAlbumno());
         vo.setTitle(albumVO.getTitle());
         vo.setKind(albumVO.getKind());
         vo.setRelease(albumVO.getRelease());
         vo.setGenre(albumVO.getGenre());
         vo.setEnter(albumVO.getEnter());
         vo.setIntro(albumVO.getIntro());
         vo.setDetail(albumVO.getDetail());
         vo.setArtistno(albumVO.getArtistno());
         vo.setFname(fname);
         vo.setFupname(fupname);
         vo.setThumbnail(thumbnail);
         vo.setFsize(fsize);
         
         upload_count = this.albumProc.update(vo); // ���� 1�� ��� ���� dbms ����
         System.out.println(upload_count);
       }
     }    
     // -----------------------------------------------------
     // ���� ���� �ڵ� ����
     // -----------------------------------------------------
     
     mav.addObject("upload_count", upload_count);    
     mav.addObject("album_name", albumVO.getTitle());
     
     mav.setViewName("redirect:/album/update_msg.jsp");
     return mav;
   }
   
  // http://localhost:9090/team2/album/delete_form.do
  /**
   * ���� ���
   * @return 
   */
  @RequestMapping(value = "/album/delete_form.do", method = RequestMethod.GET)
  public ModelAndView delete_form() {
    ModelAndView mav = new ModelAndView();

    List<Artist_Album_VO> list = this.albumProc.list_join();
    mav.addObject("list", list);

    mav.setViewName("/album/list_delete"); // webapp/categrp/list.jsp
    return mav;
  }
   
   /**
    * ÷�� ���� 1�� ���� ó��
    * 
    * @param albumno
    * @return
    */
   @RequestMapping(value = "/album/delete.do", 
                              method = RequestMethod.GET)
   public ModelAndView file_delete_proc(HttpServletRequest request,
                                                     int albumno) {
     ModelAndView mav = new ModelAndView();

     // ������ ���� ������ �о��.
     AlbumVO albumVO = albumProc.read(albumno);
     
     String upDir = Tool.getRealPath(request, "/album/storage"); // ���� ���
     Tool.deleteFile(upDir, albumVO.getFupname()); // Folder���� 1���� ���� ����
     Tool.deleteFile(upDir, albumVO.getThumbnail()); // 1���� Thumb ���� ����
     
     // DBMS���� 1���� ���� ����
     albumProc.delete(albumno);
         
     List<AlbumVO> album_list = albumProc.list();
     mav.addObject("album_list", album_list);
     
     mav.setViewName("redirect:/album/list.do"); // file_delete.jsp

     return mav;
   }

}
