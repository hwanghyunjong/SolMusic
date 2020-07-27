package dev.mvc.video;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.video.VideoProc")
public class VideoProc implements VideoProcInter {
  @Autowired
  private VideoDAOInter videoDAO;

  public VideoProc() {
    System.out.println("--> VideoProc created");
  }

  @Override
  public int create(VideoVO videoVO) {
    int cnt = 0;
    cnt = this.videoDAO.create(videoVO);
    return cnt;
  }

  @Override
  public VideoVO read(int videono) {
    VideoVO videoVO = this.videoDAO.read(videono);
    return videoVO;
  }

  @Override
  public VideoVO read_songno(int songno) {
    VideoVO videoVO = this.videoDAO.read_songno(songno);
    return videoVO;
  }

  @Override
  public List<VideoVO> read_albumno(int albumno) {
    List<VideoVO> videoVO = this.videoDAO.read_albumno(albumno);
    return videoVO;
  }

  @Override
  public List<VideoVO> read_artistno(int artistno) {
    List<VideoVO> videoVO = this.videoDAO.read_artistno(artistno);
    return videoVO;
  }


  
  

  
  

}
