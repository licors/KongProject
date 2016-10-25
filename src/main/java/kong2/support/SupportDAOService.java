package kong2.support;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class SupportDAOService implements SupportDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public ArrayList<SupportModel> selectall() {
        ArrayList<SupportModel> result = new ArrayList<SupportModel>();
        SupportMapper memberMapper = sqlSession.getMapper(SupportMapper.class);
        result = memberMapper.selectall();
        return result;
    }

    @Override
    public SupportModel selectone(SupportModel supportModel) {
        SupportMapper memberMapper = sqlSession.getMapper(SupportMapper.class);
        SupportModel result = memberMapper.selectone(supportModel);
        return result;
    }

    @Override
    public ArrayList<SupportModel> selectmember(SupportModel supportModel) {
        ArrayList<SupportModel> result = new ArrayList<SupportModel>();
        SupportMapper memberMapper = sqlSession.getMapper(SupportMapper.class);
        result = memberMapper.selectmember(supportModel);
        return result;
    }

    @Override
    public void insert(SupportModel supportModel) {
        SupportMapper memberMapper = sqlSession.getMapper(SupportMapper.class);
        memberMapper.insert(supportModel);
    }

    @Override
    public void insertmail(SupportModel supportModel) {
        SupportMapper memberMapper = sqlSession.getMapper(SupportMapper.class);
        memberMapper.insertmail(supportModel);
    }

    @Override
    public void update(SupportModel supportModel) {
        SupportMapper memberMapper = sqlSession.getMapper(SupportMapper.class);
        memberMapper.update(supportModel);
    }

    @Override
    public void readcountup(SupportModel supportModel) {
        SupportMapper memberMapper = sqlSession.getMapper(SupportMapper.class);
        memberMapper.readcountup(supportModel);
    }

    @Override
    public void updateReplyStep(SupportModel supportModel) {
        SupportMapper memberMapper = sqlSession.getMapper(SupportMapper.class);
        memberMapper.updateReplyStep(supportModel);
    }

    @Override
    public void delete(SupportModel supportModel) {
        SupportMapper memberMapper = sqlSession.getMapper(SupportMapper.class);
        memberMapper.delete(supportModel);
    }

}
