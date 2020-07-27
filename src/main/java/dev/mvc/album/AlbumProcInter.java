package dev.mvc.album;

import java.util.List;

public interface AlbumProcInter {
  /**
   * 앨범 등록
   * <xmp>
   *  <insert id="create" parameterType="AlbumVO">
   * </xmp>
   * @param albumVO
   * @return
   */
  public int create(AlbumVO albumVO);
  
  /**
   * 전체 목록
   * <xmp>
   *   <select id="list" resultType="AlbumVO">
   * </xmp>
   * @return 리스트 목록
   */
  public List<AlbumVO> list();
  
  /**
   * 통합 VO 기반 join
   * <xmp>
   *  <select id="list_join" resultType="Artist_Album_VO">
   * </xmp>
   * @return
   */
  public List<Artist_Album_VO> list_join();
  
  /**
   * 조회
   * <xmp>
   *  <select id="read" resultType="AlbumVO" parameterType="int">  
   * </xmp>
   * @param albumno
   * @return 조회할 레코드
   */
  public AlbumVO read(int albumno);
  
  /**
   * 수정 폼 조회
   * <xmp>
   *  <select id="read" resultType="AlbumVO" parameterType="int">  
   * </xmp>
   * @param albumno
   * @return 조회할 레코드
   */
  public AlbumVO read_update(int albumno);
  
  /**
   * 아티스트 번호로 조회
   * <xmp>
   *   <select id="read_artist" resultType="AlbumVO" parameterType="int">
   * </xmp>
   * @param artistno
   * @return
   */
  public List<AlbumVO> read_artist(int artistno);
  
  /**
   * 수정
   * <xmp>
   *    <update id="update" parameterType="AlbumVO">
   * </xmp>
   * @param albumVO
   * @return
   */
  public int update(AlbumVO albumVO);
  
  /**
   * 삭제
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp>
   * @param artistno
   * @return
   */
  public int delete(int albumno);

}
