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
   * 등록 폼
   * @return
   */
  @RequestMapping(value = "/artist/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/artist/create"); // webapp/categrp/create.jsp

    return mav;
  }
  
  /**
   * 파일 등록
   * @param request
   * @param artistVO
   * @return
   */
  @RequestMapping(value = "/artist/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request,
                                       ArtistVO artistVO) {
    
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    String fname = ""; // 원본 파일명
    String fupname = ""; // 업로드된 파일명
    long fsize = 0;  // 파일 사이즈
    String thumbnail = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수
    
    String upDir = Tool.getRealPath(request, "/artist/storage"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = artistVO.getFnamesMF();
    int count = fnamesMF.size(); // 전송 파일 갯수
    if (count > 0) { // 전송할 파일이 있다면
      for (MultipartFile multipartFile:fnamesMF) { // 파일 추출
        fsize = multipartFile.getSize();  // 파일 크기
        if (fsize > 0) { // 파일 크기 체크
          fname = multipartFile.getOriginalFilename(); // 원본 파일명
          // 파일 저장 후 업로드된 파일명이 리턴됨. spring.jsp, spring_1.jpg...
          fupname = Upload.saveFileSpring(multipartFile, upDir);
          
          if (Tool.isImage(fname)) { // 이미지인지 검사
            // thumb 이미지 생성, width: 120, height: 80
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
        
        upload_count = upload_count + this.artistProc.create(vo); // 파일 1건 등록 정도 dbms 저장
      }
    }    
    // -----------------------------------------------------
    // 파일 전송 코드 종료
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
   * 전체 목록
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
   * 조회
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
   * 수정 목록
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
   * 수정폼
   * @param artistno 조회할 카테고리 번호
   * @return 
   */
 @RequestMapping(value="/artist/update.do", method=RequestMethod.GET) 
 public ModelAndView update_get(int artistno) {
   ModelAndView mav = new ModelAndView();
   
   ArtistVO artistVO = this.artistProc.read(artistno);
   mav.addObject("artistVO", artistVO); // request 객체에 저장
   
   mav.setViewName("/artist/update"); // webapp/categrp/list.jsp
   return mav; // Forward
 }
 
 /**
 * 파일 수정
 * @param request
 * @param artistVO
 * @return
 */
@RequestMapping(value = "/artist/update.do", method = RequestMethod.POST)
public ModelAndView update_post(HttpServletRequest request,
                                     ArtistVO artistVO) {
  
  ModelAndView mav = new ModelAndView();
  // -----------------------------------------------------
  // 파일 전송 코드 시작
  // -----------------------------------------------------
  String fname = ""; // 원본 파일명
  String fupname = ""; // 업로드된 파일명
  long fsize = 0;  // 파일 사이즈
  String thumbnail = ""; // Preview 이미지
  int upload_count = 0; // 정상처리된 레코드 갯수
  
  String upDir = Tool.getRealPath(request, "/artist/storage"); // 절대 경로
  // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
  List<MultipartFile> fnamesMF = artistVO.getFnamesMF();
  int count = fnamesMF.size(); // 전송 파일 갯수
  if (count > 0) { // 전송할 파일이 있다면
    for (MultipartFile multipartFile:fnamesMF) { // 파일 추출
      fsize = multipartFile.getSize();  // 파일 크기
      if (fsize > 0) { // 파일 크기 체크
        fname = multipartFile.getOriginalFilename(); // 원본 파일명
        // 파일 저장 후 업로드된 파일명이 리턴됨. spring.jsp, spring_1.jpg...
        fupname = Upload.saveFileSpring(multipartFile, upDir);
        
        if (Tool.isImage(fname)) { // 이미지인지 검사
          // thumb 이미지 생성, width: 120, height: 80
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
      
      upload_count = this.artistProc.update(vo); // 파일 1건 등록 정도 dbms 저장
    }
  }    
  // -----------------------------------------------------
  // 파일 전송 코드 종료
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
 * 수정 목록
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
* 수정 목록
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
 * 첨부 파일 1건 삭제 처리
 * 
 * @param artistno
 * @return
 */
@RequestMapping(value = "/artist/delete.do", 
                           method = RequestMethod.GET)
public ModelAndView file_delete_proc(HttpServletRequest request,
                                                  int artistno) {
  ModelAndView mav = new ModelAndView();

  // 삭제할 파일 정보를 읽어옴.
  ArtistVO artistVO = artistProc.read(artistno);
  
  String upDir = Tool.getRealPath(request, "/artist/storage"); // 절대 경로
  Tool.deleteFile(upDir, artistVO.getFupname()); // Folder에서 1건의 파일 삭제
  Tool.deleteFile(upDir, artistVO.getThumbnail()); // 1건의 Thumb 파일 삭제
  
  // DBMS에서 1건의 파일 삭제
  artistProc.delete(artistno);
      
  List<ArtistVO> artist_list = artistProc.list();
  mav.addObject("artist_list", artist_list);
  
  mav.setViewName("redirect:/artist/list.do"); // file_delete.jsp

  return mav;
}

}
