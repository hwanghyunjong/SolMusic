package dev.mvc.music;

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
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;
import dev.mvc.video.VideoProcInter;
import dev.mvc.video.VideoVO;


@Controller
public class MusicCont {
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
  
  public MusicCont(){
    System.out.println("--> MusicCont created.");
  }
  
  // http://localhost:9090/team2/music/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value = "/music/create.do", method = RequestMethod.GET)
  public ModelAndView create(int albumno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/music/create"); // webapp/categrp/create.jsp

    return mav;
  }
  
 // http://localhost:9090/team2/music/create.do
 /**
  * 등록 처리
  * @param request
  * @param musicVO
  * @return
  */
 @RequestMapping(value="/music/create.do", 
                             method=RequestMethod.POST )
 public ModelAndView mp3_create(HttpServletRequest request,
                                                   MusicVO musicVO) {
   ModelAndView mav = new ModelAndView();
   // -------------------------------------------------------------------
   // 파일 전송 코드 시작
   // -------------------------------------------------------------------
   String mp3 = ""; // mp3 파일
   int upload_count = 0; // 정상처리된 레코드 갯수
   
   String upDir = Tool.getRealPath(request, "/music/storage/mp3"); // 절대 경로
   // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
   MultipartFile mf = musicVO.getMp3MF();  // 파일 목록
   long fsize = mf.getSize();  // 파일 크기
   if (fsize > 0) { // 파일 크기 체크
     // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
     // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
     mp3 = Upload.saveFileSpring(mf, upDir); 
   }    
   // -------------------------------------------------------------------
   // 파일 전송 코드 종료
   // -------------------------------------------------------------------
   MusicVO vo = new MusicVO();
   vo.setTitle(musicVO.getTitle());
   vo.setLyricist(musicVO.getLyricist());
   vo.setComposer(musicVO.getComposer());
   vo.setMp3(mp3);
   vo.setSeqno(musicVO.getSeqno());
   vo.setAlbumno(musicVO.getAlbumno());
   vo.setArtistno(musicVO.getArtistno());
   vo.setLyrics(musicVO.getLyrics());
   
   upload_count = upload_count + this.musicProc.create(vo); // 파일 1건 등록 정도 dbms 저장

   // mav.addObject("contentsno", contentsVO.getContentsno());
   mav.addObject("upload_count", upload_count);    
   mav.addObject("music_name", musicVO.getTitle());
   
   mav.setViewName("redirect:/music/create_msg.jsp"); // webapp/contents/read.jsp
   
   return mav;
 }
 
 // http://localhost:9090/team2/music/read.do?albumno=3
 /**
  * 조회
  * @return
  */
 @RequestMapping(value="/music/read.do", method=RequestMethod.GET)
 public ModelAndView read(int songno) {
   ModelAndView mav = new ModelAndView();
   
   Music_Album_Artist_VO music_Album_Artist_VO = this.musicProc.artist_album_song_list(songno);
   mav.addObject("musicVO", music_Album_Artist_VO);
   
   List<AlbumVO> albumlist = this.albumProc.read_artist(music_Album_Artist_VO.getL_artistno());
   mav.addObject("albumlist", albumlist);
   
   VideoVO videoVO = this.videoProc.read_songno(songno);
   mav.addObject("videoVO", videoVO);
  
   mav.setViewName("/music/read"); // webapp/categrp/list.jsp
   return mav;
   
 }
 
 // http://localhost:9090/team2/music/update.do?songno=3
 /**
  * 수정폼
  * @param songno 조회할 노래 번호
  * @return 
  */
  @RequestMapping(value="/music/update.do", method=RequestMethod.GET) 
  public ModelAndView update(int songno) {
    ModelAndView mav = new ModelAndView();
    
    MusicVO musicVO = this.musicProc.read_update(songno);
    mav.addObject("musicVO", musicVO); // request 객체에 저장
    
    mav.setViewName("/music/update"); // webapp/categrp/list.jsp
    return mav; // Forward
  }
  
  // http://localhost:9090/team2/music/update.do?songno=3
  /**
   * 수정 처리
   * @param songno 조회할 노래 번호
   * @return 
   */
  @RequestMapping(value="/music/update.do", method=RequestMethod.POST) 
  public ModelAndView update(HttpServletRequest request,
                                        MusicVO musicVO) {
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String mp3 = ""; // mp3 파일
    int upload_count = 0; // 정상처리된 레코드 갯수
    
    String upDir = Tool.getRealPath(request, "/music/storage/mp3"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    MultipartFile mf = musicVO.getMp3MF();  // 파일 목록
    long fsize = mf.getSize();  // 파일 크기
    if (fsize > 0) { // 파일 크기 체크
      // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      mp3 = Upload.saveFileSpring(mf, upDir); 
    }    
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    MusicVO vo = new MusicVO();
    vo.setSongno(musicVO.getSongno());
    vo.setTitle(musicVO.getTitle());
    vo.setLyricist(musicVO.getLyricist());
    vo.setComposer(musicVO.getComposer());
    vo.setSeqno(musicVO.getSeqno());
    vo.setAlbumno(musicVO.getAlbumno());
    vo.setLyrics(musicVO.getLyrics());
    vo.setMp3(mp3);
    
    upload_count = this.musicProc.update(vo); // 파일 1건 등록 정도 dbms 저장
    System.out.println(upload_count);

    // mav.addObject("contentsno", contentsVO.getContentsno());
    mav.addObject("upload_count", upload_count);    
    mav.addObject("music_name", musicVO.getTitle());
    
    mav.setViewName("redirect:/music/update_msg.jsp"); // webapp/contents/read.jsp
    
    return mav;
    
  }
  
  /**
   * 노래 1건 삭제 처리
   * 
   * @param songno
   * @return
   */
  @RequestMapping(value = "/music/delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView file_delete_proc(HttpServletRequest request,
                                                    int songno) {
    ModelAndView mav = new ModelAndView();

    // 삭제할 파일 정보를 읽어옴.
    MusicVO musicVO = musicProc.read(songno);
    int albumno = musicVO.getAlbumno();
    
    String upDir = Tool.getRealPath(request, "/music/storage/mp3"); // 절대 경로
    Tool.deleteFile(upDir, musicVO.getMp3()); // Folder에서 1건의 파일 삭제
    
    // DBMS에서 1건의 파일 삭제
    musicProc.delete(songno);
        
    mav.setViewName("redirect:/album/read.do?albumno="+albumno); // file_delete.jsp

    return mav;
  }
  
  /**
   * 노래 1건 삭제 처리
   * 
   * @param songno
   * @return
   */
  @RequestMapping(value = "/music/playlist.do", method = RequestMethod.GET)
  public ModelAndView playlist(int songno) {
    ModelAndView mav = new ModelAndView();

    Music_Album_Artist_VO listVO = this.musicProc.artist_album_song_list(songno);
    mav.addObject("listVO", listVO); // request 객체에 저장

    List<MusicVO> musicList = this.musicProc.list();
    mav.addObject("musicList", musicList);
    
    mav.setViewName("/music/playlist"); // file_delete.jsp

    return mav;
  }
  
  
  
  

}
