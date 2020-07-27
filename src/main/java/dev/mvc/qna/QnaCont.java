package dev.mvc.qna;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;



@Controller
public class QnaCont {
  @Autowired
  @Qualifier("dev.mvc.qna.QnaProc")
  private QnaProcInter qnaProc;
  
  public QnaCont() {
    System.out.println("-->QnaCon created.");
  }
  
  /**
   * 메시지
   * @param url 이동할 jsp 주소
   * @return
   */
  @RequestMapping(value="/qna/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();    

    mav.setViewName("/qna/" + url); 
    return mav; // forward
  }
   
//http://localhost:9090/team2/qna/qna_reg.do
  /**
   * 등록 폼
   * @return
  */
  @RequestMapping(value="/qna/qna_reg.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/qna/qna_reg"); //webapp/qna/qna_reg.do.jsp
    return mav;
  }
  
  //http://localhost:9090/resort/qna/qna_reg.do
  /**
  * 등록처리
  * @param contentsVO
  * @return
  */
 @RequestMapping(value = "/qna/qna_reg.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request,QnaVO qnaVO) {
    ModelAndView mav = new ModelAndView();
  
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    String qna_fname = ""; // 원본 파일명
    String qna_fupname = ""; // 업로드된 파일명
    long qna_fsize = 0;  // 파일 사이즈
    String qna_thumb = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수

    String upDir = Tool.getRealPath(request, "/qna/storage"); //절대경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = qnaVO.getFnamesMF(); //파일 목록
    int count = fnamesMF.size(); // 전송 파일 갯수
    if (count > 0) { //전송 할 파일이 있다면
      for (MultipartFile multipartFile:fnamesMF) { // 파일 추출
        qna_fsize = multipartFile.getSize();  // 파일 크기
        if (qna_fsize > 0) { // 파일 크기 체크
          qna_fname = multipartFile.getOriginalFilename(); // 원본 파일명
          qna_fupname = Upload.saveFileSpring(multipartFile, upDir); // 파일 저장 후, 업로드 파일명이 리턴됨. spring.jpg , spring_1.jsp...
          
          if (Tool.isImage(qna_fname)) { // 이미지인지 검사
            //thumb 이미지 생성 후 파일명 리턴됨, width 120, height 80
            qna_thumb = Tool.preview(upDir, qna_fupname, 572, 300); // thumb 이미지 생성
          }
        }
        QnaVO vo = new QnaVO();
        vo.setQnano(qnaVO.getQnano());
        vo.setUserno(qnaVO.getUserno());
        vo.setQna_categrpname(qnaVO.getQna_categrpname());
        vo.setQna_content(qnaVO.getQna_content());
        vo.setQna_title(qnaVO.getQna_title());
        vo.setQna_rdate(qnaVO.getQna_rdate());
        vo.setQna_fname(qna_fname);
        vo.setQna_fupname(qna_fupname);
        vo.setQna_thumb(qna_thumb);
        vo.setQna_fsize(qna_fsize);
      
        upload_count = upload_count + this.qnaProc.create(vo); // 파일 1건 등록 정도 dbms 저장
      }
    }    
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------
    
    /* //PK return
    int cnt = this.qnaProc.create(qnaVO); //Call by Reference로 전송
    mav.addObject("cnt", cnt);
    System.out.println("cnt" + cnt);*/
    mav.addObject("upload_count", upload_count);
    mav.addObject("qnano", qnaVO.getQnano()); 
    
    mav.addObject("url", "qna_reg_msg");
    
    mav.setViewName("redirect:/qna/msg.do");
    return mav; //forward
  }
 
 //http://localhost:9090/team2/qna/qna_list.do
/**
 * 전체 목록
 * @return
 */
 @RequestMapping(value="/qna/qna_list.do", method=RequestMethod.GET )
 public ModelAndView list() {
   ModelAndView mav = new ModelAndView();

   List<QnaVO> list = this.qnaProc.list();
   mav.addObject("list", list); // request.setAttribute("list", list);

   mav.setViewName("/qna/qna_list"); // /webapp/contents/list_all.jsp
   return mav;
 }
  
  //http://localhost:9090/team2/qna/qna_read.do
  /**
   * 1회 조회
   * @return
   */
  @RequestMapping(value="/qna/qna_read.do", method=RequestMethod.GET )
  public ModelAndView read(int qnano) {
    ModelAndView mav = new ModelAndView();
    
    QnaVO qnaVO = this.qnaProc.read(qnano);
    mav.addObject("qnaVO",qnaVO);
    
    List<QnaVO> list = this.qnaProc.list();
    mav.addObject("list", list); 

    mav.setViewName("/qna/qna_read"); 
    return mav;
  }
  
  //http://localhost:9090/team2/qna/qna_delete.do
  /**
  * 삭제처리
  * @param qnano 삭제할 카테고리 번호 
  * @return
  */
  @RequestMapping(value="/qna/qna_delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int qnano) {
    ModelAndView mav = new ModelAndView();

    QnaVO qnaVO = this.qnaProc.read(qnano); //삭제정보
    mav.addObject("qnaVO", qnaVO);
    
    int cnt = this.qnaProc.delete(qnano); //삭제처리
    mav.addObject("cnt", cnt);
      
    if(cnt==1) { //등록 성공   
      mav.setViewName("redirect:/qna/qna_list.do");
    }else { //등록 실패
      mav.setViewName("/qna/qna_delete"); 
    } 
    return mav;
  }
  
  // http://localhost:9090/team2/qna/qna_update.do
  /**
   * 수정 폼
   * @return
   */
  @RequestMapping(value="/qna/qna_update.do", method=RequestMethod.GET )
  public ModelAndView update(int qnano) {
    ModelAndView mav = new ModelAndView();
    
    QnaVO qnaVO = this.qnaProc.update(qnano);
    mav.addObject("qnaVO", qnaVO); 
    
    mav.setViewName("/qna/qna_update"); 
    
    return mav;
  }
  
  //http://localhost:9090/team2/qna/qna_update.do
  /**
  * 수정처리
  * @param qnaVO
  * @return
  */
  @RequestMapping(value="/qna/qna_update.do", method = RequestMethod.POST)
  public ModelAndView update(QnaVO qnaVO) {
    ModelAndView mav = new ModelAndView();
    int cnt=0;
    cnt = this.qnaProc.update(qnaVO);
    mav.addObject("cnt", cnt);  //request에 저장

    if(cnt==1) { //수정 성공   
      mav.addObject("url", "qna_updatemsg");
      
      mav.setViewName("redirect:/qna/msg.do");
    }else { //수정 실패
      mav.setViewName("/qna/qna_updatemsg"); 
    } 
    return mav;
  }
  
  /**
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9090/team2/qna/list.do
   * http://localhost:9090/team2/qna/list.do?qnano=1&word=플레이어&nowPage=1
   * @param qnano
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/qna/list.do", method = RequestMethod.GET)
  public ModelAndView list_by_search_paging(
      int userno,
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("userno", userno);
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);  // 페이지에 출력할 레코드의 범위를 산출하기위해 사용     
    
    // 검색 목록
    List<QnaVO> list = this.qnaProc.list_by_search_paging(map);
    mav.addObject("list", list);
    
    // 검색된 레코드 갯수
    int search_count = qnaProc.search_count(map);
    mav.addObject("search_count", search_count);
  
    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
     * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
     * 
     * @param listFile 목록 파일명 
     * @param cateno 카테고리번호 
     * @param search_count 검색(전체) 레코드수 
     * @param nowPage     현재 페이지
     * @param word 검색어
     * @return 페이징 생성 문자열
     */ 
    String paging = qnaProc.pagingBox("list.do", search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);

    // /contents/list_by_cateno_search_paging.jsp
    mav.setViewName("/qna/list_by_search_paging2");   
    
    return mav;
  } 
  
  // http://localhost:9090/team2/qna/reply.do?qnano=1
  /**
   * 답변 폼
   * @return
   */
  @RequestMapping(value="/qna/reply.do", method=RequestMethod.GET )
  public ModelAndView reply(int qnano) {
    ModelAndView mav = new ModelAndView();
    System.out.println("답변 대상: " + qnano);
    
    QnaVO qnaVO = this.qnaProc.read(qnano);
    mav.addObject("qnaVO", qnaVO);
    
    mav.setViewName("/qna/reply"); // webapp/contents/reply.jsp
    
    return mav;
  }
  
  // http://localhost:9090/team2/qna/reply.do
  /**
   * 답변 등록 처리
   * @return
   */
  @RequestMapping(value="/qna/reply.do", method=RequestMethod.POST )
  public ModelAndView reply(HttpServletRequest request, QnaVO qnaVO) {
    ModelAndView mav = new ModelAndView();
    
     // --------------------------- 답변 관련 코드 시작 --------------------------
     // System.out.println("댓글을 붙일 부모글 번호: " + contentsVO.getContentsno());
     QnaVO parentVO = qnaProc.read(qnaVO.getQnano()); // 부모글 정보 추출
     
     HashMap<String, Object> map = new HashMap<String, Object>();
     map.put("grpno", parentVO.getGrpno());
     map.put("ansnum",  parentVO.getAnsnum());
     qnaProc.increaseAnsnum(map); // 현재 등록된 답변 뒤로 +1 처리함.

     qnaVO.setGrpno(parentVO.getGrpno()); // 부모의 그룹번호 할당
     qnaVO.setIndent(parentVO.getIndent() + 1); // 답변 차수 증가
     qnaVO.setAnsnum(parentVO.getAnsnum() + 1); // 부모 바로 아래 등록
     // --------------------------- 답변 관련 코드 종료 --------------------------
     int cnt = this.qnaProc.reply(qnaVO); // Call By Reference로 전송
     
     System.out.println("cnt: " + cnt);
     mav.addObject("cnt", cnt);
    
    // ---------------------------------------------------------------------------------------
    // cnt, contentsno return 
    // ---------------------------------------------------------------------------------------
    // Spring <-----> contentsVO <-----> MyBATIS
    // Spring과 MyBATIS가 ContentsVO를 공유하고 있음.
    // MyBATIS는 insert후 PK 컬럼인 contentsno변수에 새로 생성된 PK를 할당함.
    int qnano = qnaVO.getQnano();  // MyBATIS 리턴된 PK
    System.out.println("qnano: " + qnano);
    mav.addObject("qnano", qnano); // request에 저장
    // ---------------------------------------------------------------------------------------
    
    if (cnt == 1) {
      mav.addObject("url", "reply_msg");
      mav.setViewName("redirect:/qna/msg.do");
    } else {
      mav.setViewName("/qna/reply_msg");
    }
    return mav;
  }
  
  
}
