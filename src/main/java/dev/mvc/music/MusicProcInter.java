package dev.mvc.music;

import java.util.List;

public interface MusicProcInter {
  /**
   * 생성
   * <xmp>
   *  <insert id="create" parameterType="MusicVO"> 
   * </xmp>
   * @param musicVO
   * @return 생성된 레코드 갯수
   */
  public int create(MusicVO musicVO);
  
  /**
   * 목록
   * <xmp>
   *    <select id="list" resultType="MusicVO">
   * </xmp>
   * @return 뮤직 리스트
   */
  public List<MusicVO> list();
  
  /**
   * Music, Album, Artist VO JOIN
   * <xmp>
   *   <select id="artist_album_song_list" parameterType="int" resultMap="Music_Album_Artist_VO">
   * </xmp>
   * @return
   */
  public Music_Album_Artist_VO artist_album_song_list(int songno);
  
  /**
   * 조회
   * <xmp>
   *   <select id="read" resultType="MusicVO" parameterType="int">
   * </xmp>
   * @param songno
   * @return
   */
  public MusicVO read(int songno);
  
  /**
   * 조회 수정
   * <xmp>
   *    <select id="read_update" resultType="MusicVO" parameterType="int">
   * </xmp>
   * @param musicVO
   * @return
   */
  public MusicVO read_update(int songno);
  
  /**
   * 앨범 번호로 노래 조회
   * <xmp>
   *    <select id="read_albumno" resultType="MusicVO" parameterType="int">
   * </xmp>
   * @param albumno
   * @return
   */
  public List<MusicVO> read_albumno(int albumno);
  
  /**
   * 아티스트 번호로 노래, 앨범 조회
   * <xmp>
   *    <select id="artist_read" parameterType="int" resultType="Music_Album_Artist_VO">
   * </xmp>
   * @param artistno
   * @return
   */
  public List<Music_Album_Artist_VO> artist_read(int artistno);
  
  /**
   * 수정
   * <xmp>
   *    <update id="update" parameterType="MusicVO">
   * </xmp>
   * @param musicVO
   * @return
   */
  public int update(MusicVO musicVO);
  
  /**
   * 삭제
   * <xmp>
   *    <delete id="delete" parameterType="int">
   * </xmp>
   * @param songno
   * @return
   */
  public int delete(int songno);
}
