package dev.mvc.artist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.artist.ArtistProc")
public class ArtistProc implements ArtistProcInter {
  @Autowired
  private ArtistDAOInter artistDAO;

  public ArtistProc() {
    System.out.println("--> ArtistProc created");
  }

  @Override
  public int create(ArtistVO artistVO) {
    int cnt = this.artistDAO.create(artistVO);
    return cnt;
  }

  @Override
  public List<ArtistVO> list() {
    List<ArtistVO> list = null;
    list = this.artistDAO.list();
    
    return list;
  }

  @Override
  public ArtistVO read(int artistno) {
    ArtistVO artistVO = null;
    artistVO = this.artistDAO.read(artistno);
    
    return artistVO;
  }

  @Override
  public int update(ArtistVO artistVO) {
    int cnt = this.artistDAO.update(artistVO);
    return cnt;
  }

  @Override
  public int delete(int artistno) {
    int cnt = this.artistDAO.delete(artistno);
    return cnt;
  }
  
  

}
