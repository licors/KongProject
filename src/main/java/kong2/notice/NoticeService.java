package kong2.notice;

import java.util.List;



import javax.annotation.Resource;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public class NoticeService implements NoticeDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<NoticeModel> selectall() {
		List<NoticeModel> list;
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		list=noticeMapper.selectall();
	
		return list;
	}

	@Override
	public NoticeModel selectOne(int no) {
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		NoticeModel noticeModel = noticeMapper.selectOne(no);
		return noticeModel;
	}

	@Override
	public void delete(int no) {
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		noticeMapper.delete(no);
		
	}

	@Override
	public void update(NoticeModel noticemodel) {
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		noticeMapper.update(noticemodel);
	}

	@Override
	public void insert(NoticeModel noticemodel) {
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		noticeMapper.insert(noticemodel);
		
	}
	
    @Override
    public void readcount(NoticeModel noticeModel) {
        NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
        noticeMapper.readcount(noticeModel);
    }


	

}



