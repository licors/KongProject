package kong2.support;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class SupportService implements SupportDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public ArrayList<SupportModel> selectall() {
        ArrayList<SupportModel> result = new ArrayList<SupportModel>();
        SupportMapper SupportMapper = sqlSession.getMapper(SupportMapper.class);
        result = SupportMapper.selectall();
        return result;
    }

    @Override
    public SupportModel selectone(SupportModel supportModel) {
        SupportMapper SupportMapper = sqlSession.getMapper(SupportMapper.class);
        SupportModel result = SupportMapper.selectone(supportModel);
        return result;
    }

    @Override
    public ArrayList<SupportModel> selectmember(SupportModel supportModel) {
        ArrayList<SupportModel> result = new ArrayList<SupportModel>();
        SupportMapper SupportMapper = sqlSession.getMapper(SupportMapper.class);
        result = SupportMapper.selectmember(supportModel);
        return result;
    }

    @Override
    public void insert(SupportModel supportModel) {
        SupportMapper SupportMapper = sqlSession.getMapper(SupportMapper.class);
        SupportMapper.insert(supportModel);
    }

    @Override
    public void insertmail(SupportModel supportModel) {
        SupportMapper SupportMapper = sqlSession.getMapper(SupportMapper.class);
        SupportMapper.insertmail(supportModel);
    }

    @Override
    public void update(SupportModel supportModel) {
        SupportMapper SupportMapper = sqlSession.getMapper(SupportMapper.class);
        SupportMapper.update(supportModel);
    }

    @Override
    public void readcountup(SupportModel supportModel) {
        SupportMapper SupportMapper = sqlSession.getMapper(SupportMapper.class);
        SupportMapper.readcountup(supportModel);
    }

    @Override
    public void updateReplyStep(SupportModel supportModel) {
        SupportMapper SupportMapper = sqlSession.getMapper(SupportMapper.class);
        SupportMapper.updateReplyStep(supportModel);
    }

    @Override
    public void delete(SupportModel supportModel) {
        SupportMapper SupportMapper = sqlSession.getMapper(SupportMapper.class);
        SupportMapper.delete(supportModel);
    }

}
