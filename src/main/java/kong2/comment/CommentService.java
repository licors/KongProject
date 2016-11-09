package kong2.comment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kong2.faq.controller.FaqMapper;

@Service
public class CommentService implements CommentDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CommentModel> selectAll(int showcase_num) {
		// TODO Auto-generated method stub
		List<CommentModel> list;
		CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
		list = commentMapper.selectAll(showcase_num);
		return list;
	}

	@Override
	public CommentModel selectOne(int comment_num) {
		// TODO Auto-generated method stub
		CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
		CommentModel commentModel = commentMapper.selectOne(comment_num);
		return commentModel;
	}

	@Override
	public void delete(int comment_num) {
		// TODO Auto-generated method stub
		CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
		commentMapper.delete(comment_num);
	}

	@Override
	public void update(CommentModel commentModel) {
		// TODO Auto-generated method stub
		CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
		commentMapper.update(commentModel);
	}

	@Override
	public void insert(CommentModel commentModel) {
		// TODO Auto-generated method stub
		CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
		commentMapper.insert(commentModel);
	}
	
	
}
