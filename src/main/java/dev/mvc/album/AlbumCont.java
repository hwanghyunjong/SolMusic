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
   * 등록 폼
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
   * 등록 과정
   * @param request
   * @param albumVO
   * @return
   */
  @RequestMapping(value = "/album/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request,
                                       AlbumVO albumVO) {
    
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    String fname = ""; // 원본 파일명
    String fupname = ""; // 업로드된 파일명
    long fsize = 0;  // 파일 사이즈
    String thumbnail = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수
    
    String upDir = Tool.getRealPath(request, "/album/storage"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = albumVO.getFnamesMF();
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
        
        upload_count = upload_count + this.albumProc.create(vo); // 파일 1건 등록 정도 dbms 저장
      }
    }    
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------
    
    mav.addObject("upload_count", upload_count);    
    mav.addObject("album_name", albumVO.getTitle());
    
    mav.setViewName("redirect:/album/create_msg.jsp");
    return mav;
  }
  
  // http://localhost:9090/team2/album/list.do
  /**
   * 전체 목록
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
  * 노래 생성 전 목록
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
   * 조회
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
   * 수정 목록
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
   * 수정폼
   * @param artistno 조회할 카테고리 번호
   * @return 
   */
   @RequestMapping(value="/album/update.do", method=RequestMethod.GET) 
   public ModelAndView update_get(int albumno) {
     ModelAndView mav = new ModelAndView();
     
     AlbumVO albumVO = this.albumProc.read_update(albumno);
     mav.addObject("albumVO", albumVO); // request 객체에 저장
     
     mav.setViewName("/album/update"); // webapp/categrp/list.jsp
     return mav; // Forward
   }
   
   /**
    * 파일 수정
    * @param request
    * @param artistVO
    * @return
    */
   @RequestMapping(value = "/album/update.do", method = RequestMethod.POST)
   public ModelAndView update_post(HttpServletRequest request,
                                        AlbumVO albumVO) {
     
     ModelAndView mav = new ModelAndView();
     // -----------------------------------------------------
     // 파일 전송 코드 시작
     // -----------------------------------------------------
     String fname = ""; // 원본 파일명
     String fupname = ""; // 업로드된 파일명
     long fsize = 0;  // 파일 사이즈
     String thumbnail = ""; // Preview 이미지
     int upload_count = 0; // 정상처리된 레코드 갯수
     
     String upDir = Tool.getRealPath(request, "/album/storage"); // 절대 경로
     // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
     List<MultipartFile> fnamesMF = albumVO.getFnamesMF();
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
         
         upload_count = this.albumProc.update(vo); // 파일 1건 등록 정도 dbms 저장
         System.out.println(upload_count);
       }
     }    
     // -----------------------------------------------------
     // 파일 전송 코드 종료
     // -----------------------------------------------------
     
     mav.addObject("upload_count", upload_count);    
     mav.addObject("album_name", albumVO.getTitle());
     
     mav.setViewName("redirect:/album/update_msg.jsp");
     return mav;
   }
   
  // http://localhost:9090/team2/album/delete_form.do
  /**
   * 삭제 목록
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
    * 첨부 파일 1건 삭제 처리
    * 
    * @param albumno
    * @return
    */
   @RequestMapping(value = "/album/delete.do", 
                              method = RequestMethod.GET)
   public ModelAndView file_delete_proc(HttpServletRequest request,
                                                     int albumno) {
     ModelAndView mav = new ModelAndView();

     // 삭제할 파일 정보를 읽어옴.
     AlbumVO albumVO = albumProc.read(albumno);
     
     String upDir = Tool.getRealPath(request, "/album/storage"); // 절대 경로
     Tool.deleteFile(upDir, albumVO.getFupname()); // Folder에서 1건의 파일 삭제
     Tool.deleteFile(upDir, albumVO.getThumbnail()); // 1건의 Thumb 파일 삭제
     
     // DBMS에서 1건의 파일 삭제
     albumProc.delete(albumno);
         
     List<AlbumVO> album_list = albumProc.list();
     mav.addObject("album_list", album_list);
     
     mav.setViewName("redirect:/album/list.do"); // file_delete.jsp

     return mav;
   }

}
