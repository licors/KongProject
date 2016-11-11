package kong2.showcase;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShowcaseService implements ShowcaseDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public ArrayList<ShowcaseModel> selectall() {
        ShowcaseMapper ShowcaseMapper = sqlSession.getMapper(ShowcaseMapper.class);
        ArrayList<ShowcaseModel> result = ShowcaseMapper.selectall();
        return result;
    }

    @Override
    public ArrayList<ShowcaseModel> selectmain(ShowcaseModel showcaseModel) {
        ArrayList<ShowcaseModel> result = new ArrayList<ShowcaseModel>();
        ShowcaseMapper ShowcaseMapper = sqlSession.getMapper(ShowcaseMapper.class);
        result = ShowcaseMapper.selectmain(showcaseModel);
        return result;
    }

    @Override
    public ArrayList<ShowcaseModel> selectcategory(ShowcaseModel showcaseModel) {
        ArrayList<ShowcaseModel> result = new ArrayList<ShowcaseModel>();
        ShowcaseMapper ShowcaseMapper = sqlSession.getMapper(ShowcaseMapper.class);
        result = ShowcaseMapper.selectcategory(showcaseModel);
        return result;
    }

    @Override
    public ShowcaseModel selectone(ShowcaseModel showcaseModel) {
        ShowcaseMapper ShowcaseMapper = sqlSession.getMapper(ShowcaseMapper.class);
        ShowcaseModel result = ShowcaseMapper.selectone(showcaseModel);
        return result;
    }

    @Override
    public ArrayList<ShowcaseModel> search_subject(ShowcaseSearchModel showcaseSearchModel) {
        ArrayList<ShowcaseModel> result = new ArrayList<ShowcaseModel>();
        ShowcaseMapper ShowcaseMapper = sqlSession.getMapper(ShowcaseMapper.class);
        result = ShowcaseMapper.search_subject(showcaseSearchModel);
        return result;
    }

    @Override
    public ArrayList<ShowcaseModel> search_subject_category(ShowcaseSearchModel showcaseSearchModel) {
        ArrayList<ShowcaseModel> result = new ArrayList<ShowcaseModel>();
        ShowcaseMapper ShowcaseMapper = sqlSession.getMapper(ShowcaseMapper.class);
        result = ShowcaseMapper.search_subject_category(showcaseSearchModel);
        return result;
    }

    @Override
    public ArrayList<ShowcaseModel> search_tag(ShowcaseSearchModel showcaseSearchModel) {
        ArrayList<ShowcaseModel> result = new ArrayList<ShowcaseModel>();
        ShowcaseMapper ShowcaseMapper = sqlSession.getMapper(ShowcaseMapper.class);
        result = ShowcaseMapper.search_tag(showcaseSearchModel);
        return result;
    }

    @Override
    public ArrayList<ShowcaseModel> search_category_tag(ShowcaseSearchModel showcaseSearchModel) {
        ArrayList<ShowcaseModel> result = new ArrayList<ShowcaseModel>();
        ShowcaseMapper ShowcaseMapper = sqlSession.getMapper(ShowcaseMapper.class);
        result = ShowcaseMapper.search_category_tag(showcaseSearchModel);
        return result;
    }

    @Override
    public int selectLastNo() {
        ShowcaseMapper ShowcaseMapper = sqlSession.getMapper(ShowcaseMapper.class);
        int result = ShowcaseMapper.selectLastNo();
        return result;
    }

    @Override
    public void insert(ShowcaseModel showcaseModel) {
        ShowcaseMapper ShowcaseMapper = sqlSession.getMapper(ShowcaseMapper.class);
        ShowcaseMapper.insert(showcaseModel);
    }

    @Override
    public void update(ShowcaseModel showcaseModel) {
        ShowcaseMapper ShowcaseMapper = sqlSession.getMapper(ShowcaseMapper.class);
        ShowcaseMapper.update(showcaseModel);
    }

    @Override
    public void delete(ShowcaseModel showcaseModel) {
        ShowcaseMapper ShowcaseMapper = sqlSession.getMapper(ShowcaseMapper.class);
        ShowcaseMapper.delete(showcaseModel);
    }

    @Override
    public void readcountup(ShowcaseModel showcaseModel) {
        ShowcaseMapper ShowcaseMapper = sqlSession.getMapper(ShowcaseMapper.class);
        ShowcaseMapper.readcountup(showcaseModel);
    }

    @Override
    public void ordercountup(ShowcaseModel showcaseModel) {
        ShowcaseMapper ShowcaseMapper = sqlSession.getMapper(ShowcaseMapper.class);
        ShowcaseMapper.ordercountup(showcaseModel);
    }

    @Override
    public void ordercountdown(ShowcaseModel showcaseModel) {
        ShowcaseMapper ShowcaseMapper = sqlSession.getMapper(ShowcaseMapper.class);
        ShowcaseMapper.ordercountdown(showcaseModel);
    }

	public List<ShowcaseModel>  best_10() {
		List<ShowcaseModel> result;
		ShowcaseMapper ShowcaseMapper = sqlSession.getMapper(ShowcaseMapper.class);
		result=ShowcaseMapper.best_10();
		return result;
	}

}
