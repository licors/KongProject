package kong2.support;

import java.util.ArrayList;

public interface SupportMapper {

    /**
     * 모든 문의글 출력
     *
     * @return 모든 문의글 리턴
     */
    ArrayList<SupportModel> selectall();

    /**
     * 하나의 문의글 출력
     *
     * @param supportModel #{support_num}
     * @return 문의글 1개 출력
     */
    SupportModel selectone(SupportModel supportModel);

    /**
     * 회원용 회원 기준 모든 문의글 출력, 관리자의 답변글도 같이 출력
     *
     * @param supportModel #{member_num}
     * @return 회원 기준의 모든 문의글 + 답변 리턴
     */
    ArrayList<SupportModel> selectmember(SupportModel supportModel);

    /**
     * 문의글 작성
     *
     * @param supportModel #{member_num}, #{type}, #{email}, #{content},
     * #{reg_date}, #{re_step}, #{re_level}
     */
    void insert(SupportModel supportModel);

    /**
     * 문의글 답변 작성, 회원검색에 출력하기 위해 member_num 은 회원의 member_num 으로 삽입
     *
     * @param supportModel #{member_num}, #{type}, #{email}, #{content},
     * #{reg_date}, #{ref}, #{re_step}, #{re_level}
     */
    void insertmail(SupportModel supportModel);

    /**
     * 문의글 수정
     *
     * @param supportModel #{type}, #{email}, #{email}, #{support_num}
     */
    void update(SupportModel supportModel);

    /**
     * 조회수 1증가
     *
     * @param supportModel #{support_num}
     */
    void readcountup(SupportModel supportModel);

    /**
     * 문의글 답변 계층 증가
     *
     * @param supportModel #{ref}, #{re_step}
     */
    void updateReplyStep(SupportModel supportModel);

    /**
     * 문의글 삭제
     *
     * @param supportModel #{support_num}
     */
    void delete(SupportModel supportModel);
}
