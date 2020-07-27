package dev.mvc.fcate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.fcate.FcateProc")
public class FcateProc implements FcateProcInter{
  @Autowired
  private FcateDAOInter fcateDAO;

  @Override
  public int create(FcateVO fcateVO) {
    int cnt=this.fcateDAO.create(fcateVO);
    return cnt;
  }

  @Override
  public List<FcateVO> list() {
    List<FcateVO> list = null;
    list = this.fcateDAO.list();
    return list;
  }

  @Override
  public FcateVO read(int cateno) {
    FcateVO fcateVO = null;
    fcateVO = this.fcateDAO.read(cateno);
    return fcateVO;
  }
  
  @Override
  public FcateVO update(int cateno) {
    FcateVO fcateVO = this.fcateDAO.read(cateno);
    return fcateVO;
  }

  @Override
  public int update(FcateVO fcateVO) {
    int cnt =0;
    cnt = this.fcateDAO.update(fcateVO);
    return cnt;
  }

  @Override
  public int delete(int cateno) {
    int cnt=0;
    cnt = this.fcateDAO.delete(cateno);
    return cnt;
  }

}

