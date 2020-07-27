package dev.mvc.artist;

import java.util.List;


public interface ArtistDAOInter {
  /**
   * 생성
   * <xmp>
   *  <insert id="create" parameterType="ArtistVO"> 
   * </xmp>
   * @param artistVO
   * @return 생성된 레코드 갯수
   */
  public int create(ArtistVO artistVO);
  
  /**
   * 전체 이미지 목록
   * <xmp>
   *   <select id="list" resultType="ArtistVO">
   * </xmp>
   * @return 리스트 목록
   */
  public List<ArtistVO> list();
  
  /**
   * 조회
   * <xmp>
   *    <select id="read" resultType="ArtistVO" parameterType="int">
   * </xmp>
   * @param artistno
   * @return 조회할 레코드
   */
  public ArtistVO read(int artistno);
  
  /**
   * 수정
   * <xmp>
   *    <update id="update" parameterType="ArtistVO">
   * </xmp>
   * @param artistVO
   * @return 수정할 레코드
   */
  public int update(ArtistVO artistVO);
  
  /**
   * 삭제
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp>
   * @param artistno
   * @return
   */
  public int delete(int artistno);

}
