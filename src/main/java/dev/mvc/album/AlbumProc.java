package dev.mvc.album;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.album.AlbumProc")
public class AlbumProc implements AlbumProcInter {
  @Autowired
  private AlbumDAOInter albumDAO;

  public AlbumProc() {
    System.out.println("--> AlbumProc created");
  }

  @Override
  public int create(AlbumVO albumVO) {
    int cnt = 0;
    String intro = albumVO.getIntro();
    intro = Tool.convertChar(intro);
    
    String detail = albumVO.getDetail();
    detail = Tool.convertChar(detail);
    
    albumVO.setIntro(intro);
    albumVO.setDetail(detail);
    
    cnt = this.albumDAO.create(albumVO);
    return cnt;
  }

  @Override
  public List<AlbumVO> list() {
    List<AlbumVO> list = null;
    list = this.albumDAO.list();
    
    return list;
  }
  
  @Override
  public List<Artist_Album_VO> list_join() {
    List<Artist_Album_VO> list_join = this.albumDAO.list_join();
    return list_join;
  }

  @Override
  public AlbumVO read(int albumno) {
    AlbumVO albumVO = null;
    albumVO = this.albumDAO.read(albumno);
    
    return albumVO;
  }
  
  @Override
  public AlbumVO read_update(int albumno) {
    AlbumVO albumVO = null;
    albumVO = this.albumDAO.read(albumno);
    String intro = albumVO.getIntro();
    intro = Tool.convertChar1(intro);
    
    String detail = albumVO.getDetail();
    detail = Tool.convertChar1(detail);
    
    albumVO.setIntro(intro);
    albumVO.setDetail(detail);
    
    
    return albumVO;
  }

  @Override
  public List<AlbumVO> read_artist(int artistno) {
    List<AlbumVO> read_artist = this.albumDAO.read_artist(artistno);
    return read_artist;
  }

  @Override
  public int update(AlbumVO albumVO) {
    int cnt = 0;
    String intro = albumVO.getIntro();
    intro = Tool.convertChar(intro);
    
    String detail = albumVO.getDetail();
    detail = Tool.convertChar(detail);
    
    albumVO.setIntro(intro);
    albumVO.setDetail(detail);
    
    cnt = this.albumDAO.update(albumVO);
    return cnt;
  }

  @Override
  public int delete(int albumno) {
    int cnt = this.albumDAO.delete(albumno);
    return cnt;
  }





  
  

}
