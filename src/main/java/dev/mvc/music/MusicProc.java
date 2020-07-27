package dev.mvc.music;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.music.MusicProc")
public class MusicProc implements MusicProcInter {
  @Autowired
  private MusicDAOInter musicDAO;

  public MusicProc() {
    System.out.println("--> MusicProc created");
  }

  @Override
  public int create(MusicVO musicVO) {
    int cnt = 0;
    String lyrics = musicVO.getLyrics();
    lyrics = Tool.convertChar(lyrics);
    
    musicVO.setLyrics(lyrics);
    
    cnt = this.musicDAO.create(musicVO);
    return cnt;
  }

  @Override
  public Music_Album_Artist_VO artist_album_song_list(int songno) {
    Music_Album_Artist_VO music_Album_Artist_VO = null;
    music_Album_Artist_VO = this.musicDAO.artist_album_song_list(songno);
    return music_Album_Artist_VO;
  }

  @Override
  public List<MusicVO> read_albumno(int albumno) {
    List<MusicVO> read_albumno = null;
    read_albumno = this.musicDAO.read_albumno(albumno);
    return read_albumno;
  }

  @Override
  public List<Music_Album_Artist_VO> artist_read(int artistno) {
    List<Music_Album_Artist_VO> artist_read = null;
    artist_read = this.musicDAO.artist_read(artistno);
    
    return artist_read;
  }

  @Override
  public int update(MusicVO musicVO) {
    int cnt = 0;
    String lyrics = musicVO.getLyrics();
    lyrics = Tool.convertChar(lyrics);
    
    musicVO.setLyrics(lyrics);
    
    cnt = this.musicDAO.update(musicVO);
    return cnt;
  }

  @Override
  public MusicVO read(int songno) {
    MusicVO musicVO = this.musicDAO.read(songno);
    return musicVO;
  }

  @Override
  public MusicVO read_update(int songno) {
    MusicVO musicVO = null;
    musicVO = this.musicDAO.read(songno);
    String lyrics = musicVO.getLyrics();
    lyrics = Tool.convertChar1(lyrics);
    
    musicVO.setLyrics(lyrics);;
    
    return musicVO;
  }

  @Override
  public int delete(int songno) {
    int cnt = 0;
    cnt = this.musicDAO.delete(songno);
    return cnt;
  }

  @Override
  public List<MusicVO> list() {
    List<MusicVO> list = this.musicDAO.list();
    return list;
  }


  
  

  
  

}
