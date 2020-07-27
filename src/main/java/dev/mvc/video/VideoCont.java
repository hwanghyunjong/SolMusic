package dev.mvc.video;

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
import dev.mvc.artist.ArtistProcInter;
import dev.mvc.artist.ArtistVO;
import dev.mvc.music.MusicProcInter;
import dev.mvc.music.Music_Album_Artist_VO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;


@Controller
public class VideoCont {
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
  
  public VideoCont(){
    System.out.println("--> VideoCont created.");
  }
  
  // http://localhost:9090/team2/video/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value = "/video/create.do", method = RequestMethod.GET)
  public ModelAndView create(int songno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/video/create"); // webapp/categrp/create.jsp

    return mav;
  }
  
  /**
   * 파일 등록
   * @param request
   * @param videoVO
   * @return
   */
  @RequestMapping(value = "/video/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request,
                                       VideoVO videoVO) {
    
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    String fname = ""; // 원본 파일명
    String fupname = ""; // 업로드된 파일명
    long fsize = 0;  // 파일 사이즈
    String thumbnail = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수
    
    String upDir = Tool.getRealPath(request, "/video/storage"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = videoVO.getFnamesMF();
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
        VideoVO vo = new VideoVO();
        vo.setTitle(videoVO.getTitle());
        vo.setArtist(videoVO.getArtist());
        vo.setRelease(videoVO.getRelease());
        vo.setYoutube(videoVO.getYoutube());
        vo.setSongno(videoVO.getSongno());
        vo.setAlbumno(videoVO.getAlbumno());
        vo.setArtistno(videoVO.getArtistno());
        vo.setSeqno(videoVO.getSeqno());
        vo.setFname(fname);
        vo.setFupname(fupname);
        vo.setThumbnail(thumbnail);
        vo.setFsize(fsize);
        
        upload_count = upload_count + this.videoProc.create(vo); // 파일 1건 등록 정도 dbms 저장
      }
    }    
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------
    
    mav.addObject("upload_count", upload_count);    
    mav.addObject("video_name", videoVO.getTitle());
    // mav.addObject("cateno", cateno);   
    
    // ra.addAttribute("upload_count", upload_count);
    // ra.addAttribute("categrpno", categrpno);
    // ra.addAttribute("contentsno", attachfileVO.getContentsno());
    
    mav.setViewName("redirect:/video/create_msg.jsp");
    return mav;
  }
  
  // http://localhost:9090/team2/video/read.do?albumno=3
  /**
   * 
   * @param videono
   * @return
   */
  @RequestMapping(value="/video/read.do", method=RequestMethod.GET)
  public ModelAndView read(int videono) {
    ModelAndView mav = new ModelAndView();
    
    VideoVO videoVO = this.videoProc.read(videono);
    mav.addObject("videoVO", videoVO);
    
    Music_Album_Artist_VO music_Album_Artist_VO = this.musicProc.artist_album_song_list(videoVO.getSongno());
    mav.addObject("musicVO", music_Album_Artist_VO);
   
    mav.setViewName("/video/read"); // webapp/categrp/list.jsp
    return mav;
    
  }
 
 

}
