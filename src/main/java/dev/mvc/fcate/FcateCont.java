package dev.mvc.fcate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FcateCont {
  @Autowired
  @Qualifier("dev.mvc.fcate.FcateProc")
  private FcateProcInter fcateProc;

  public FcateCont() {
    System.out.println("-->FcateCont created");
  }

  /**
   * 등록
   * 
   * @return
   */
  @RequestMapping(value = "/fcate/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/fcate/create");
    return mav;
  }

  // http://localhost:9090/resort/cate/create.do
  /**
   * 등록 처리
   * 
   * @param cateVO
   * @return
   */
  @RequestMapping(value = "/fcate/create.do", method = RequestMethod.POST)
  public ModelAndView create(FcateVO fcateVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.fcateProc.create(fcateVO);
    mav.addObject("cnt", cnt); // request에 저장

    if (cnt == 1) {
      mav.setViewName("/fcate/create_msg");
    } else {
      mav.setViewName("/fcate/create_msg");
    }

    return mav;
  }

  /**
   * 전체목록
   * 
   * @return
   */
  @RequestMapping(value = "/fcate/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<FcateVO> list = this.fcateProc.list();
    mav.addObject("list", list);

    mav.setViewName("/fcate/list");
    return mav;
  }

  // http://localhost:9090/team2/fcate/update.do
  /**
   * 조회수정폼
   * 
   * @param cateno
   * @return
   */
  @RequestMapping(value = "/fcate/update.do", method = RequestMethod.GET)
  public ModelAndView update(int cateno) {
    ModelAndView mav = new ModelAndView();

    FcateVO fcateVO = this.fcateProc.read(cateno);
    mav.addObject("fcateVO", fcateVO);

    mav.setViewName("/fcate/update");
    return mav;
  }

  /**
   * 수정 처리
   * 
   * @param fcateVO
   * @return
   */
  @RequestMapping(value = "/fcate/update.do", method = RequestMethod.POST)
  public ModelAndView update(FcateVO fcateVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.fcateProc.update(fcateVO);
    mav.addObject("cnt", cnt);

    mav.setViewName("redirect:/fcate/list.do");
    return mav;
  }

  /**
   * 조회 + 삭제폼
   * 
   * @param cateno 삭제할 카테고리 번호
   * @return
   */
  @RequestMapping(value = "/fcate/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int cateno) {
    ModelAndView mav = new ModelAndView();

    FcateVO fcateVO = this.fcateProc.read(cateno);
    mav.addObject("fcateVO", fcateVO); // request 객체에 저장

    List<FcateVO> list = this.fcateProc.list();
    mav.addObject("list", list); // request 객체에 저장

    mav.setViewName("/fcate/read_delete"); // webapp/cate/read_delete.jsp
    return mav; // forward
  }

  /**
   * 삭제 처리
   * 
   * @param fcateVO
   * @return
   */
  @RequestMapping(value = "/fcate/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int cateno) {
    ModelAndView mav = new ModelAndView();

    FcateVO fcateVO = this.fcateProc.read(cateno);
    mav.addObject("fcateVO", fcateVO);

    int cnt = this.fcateProc.delete(cateno);
    mav.addObject("cnt", cnt);

    mav.setViewName("/fcate/list");
    return mav;
  }

}
