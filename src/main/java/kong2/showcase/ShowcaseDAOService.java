package kong2.showcase;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShowcaseDAOService implements ShowcaseDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public ArrayList<ShowcaseModel> selectmain(ShowcaseModel showcaseModel) {
        ArrayList<ShowcaseModel> result = new ArrayList<ShowcaseModel>();
        ShowcaseMapper memberMapper = sqlSession.getMapper(ShowcaseMapper.class);
        result = memberMapper.selectmain(showcaseModel);
        return result;
    }

    @Override
    public ArrayList<ShowcaseModel> selectcategory(ShowcaseModel showcaseModel) {
        ArrayList<ShowcaseModel> result = new ArrayList<ShowcaseModel>();
        ShowcaseMapper memberMapper = sqlSession.getMapper(ShowcaseMapper.class);
        result = memberMapper.selectcategory(showcaseModel);
        return result;
    }

    @Override
    public ShowcaseModel selectone(ShowcaseModel showcaseModel) {
        ShowcaseMapper memberMapper = sqlSession.getMapper(ShowcaseMapper.class);
        ShowcaseModel result = memberMapper.selectone(showcaseModel);
        return result;
    }

    @Override
    public int selectLastNo() {
        ShowcaseMapper memberMapper = sqlSession.getMapper(ShowcaseMapper.class);
        int result = memberMapper.selectLastNo();
        return result;
    }

    @Override
    public void insert(ShowcaseModel showcaseModel) {
        ShowcaseMapper memberMapper = sqlSession.getMapper(ShowcaseMapper.class);
        memberMapper.insert(showcaseModel);
    }

    @Override
    public void update(ShowcaseModel showcaseModel) {
        ShowcaseMapper memberMapper = sqlSession.getMapper(ShowcaseMapper.class);
        memberMapper.update(showcaseModel);
    }

    @Override
    public void delete(ShowcaseModel showcaseModel) {
        ShowcaseMapper memberMapper = sqlSession.getMapper(ShowcaseMapper.class);
        memberMapper.delete(showcaseModel);
    }

    @Override
    public void readcountup(ShowcaseModel showcaseModel) {
        ShowcaseMapper memberMapper = sqlSession.getMapper(ShowcaseMapper.class);
        memberMapper.readcountup(showcaseModel);
    }

    @Override
    public void ordercountup(ShowcaseModel showcaseModel) {
        ShowcaseMapper memberMapper = sqlSession.getMapper(ShowcaseMapper.class);
        memberMapper.ordercountup(showcaseModel);
    }

    @Override
    public void ordercountdown(ShowcaseModel showcaseModel) {
        ShowcaseMapper memberMapper = sqlSession.getMapper(ShowcaseMapper.class);
        memberMapper.ordercountdown(showcaseModel);
    }

}
