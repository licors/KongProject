/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kong2.showcase;

import java.util.ArrayList;

/**
 *
 * @author user2
 */
public interface ShowcaseMapper {

    /**
     * 모든 전시, 미술, 이벤트 글 출력
     *
     * @return show_status 0(예정중), 1(계최중) 글 리턴
     */
//    ArrayList<ShowcaseModel> selectall();
    /**
     * 메인에서 활용할 수 있는 각 showcase_category 기준 최신글 9개를 출력
     *
     * @param showcaseModel #{showcase_category}
     * @return show_status 0(예정중), 1(계최중) 글 리턴
     */
    ArrayList<ShowcaseModel> selectmain(ShowcaseModel showcaseModel);

    /**
     * showcase_category 기준 모든글 출력
     *
     * @param showcaseModel #{showcase_category}
     * @return show_status 0(예정중), 1(계최중) 글 리턴
     */
    ArrayList<ShowcaseModel> selectcategory(ShowcaseModel showcaseModel);

    /**
     * showcase_num 로 글 1개 출력
     *
     * @param showcaseModel #{showcase_num}
     * @return 글 1개 출력
     */
    ShowcaseModel selectone(ShowcaseModel showcaseModel);

    /**
     * 마지막 글의 번호를 출력
     *
     * @return lastshowcase_num
     */
    int selectLastNo();

    /**
     * 글 작성
     *
     * @param showcaseModel #{subject}, #{address1}, #{address2}, #{start_date},
     * #{end_date}, #{price}, #{tel}, #{tag}, #{content}, #{file_savname},
     * #{readcount}, #{ordercount}, #{map}, #{show_status}, #{showcase_category}
     */
    void insert(ShowcaseModel showcaseModel);

    /**
     * 글 수정
     *
     * @param showcaseModel #{showcase_num}, #{subject}, #{address1},
     * #{address2}, #{start_date}, #{end_date}, #{price}, #{tel}, #{tag},
     * #{content}, #{map}, #{showcase_category}
     */
    void update(ShowcaseModel showcaseModel);

    /**
     * 삭제처럼 보이도록 show_status 를 -1로 수정
     *
     * @param showcaseModel #{show_status}, #{showcase_num}
     */
    void delete(ShowcaseModel showcaseModel);

    /**
     * 조회수 1증가
     *
     * @param showcaseModel #{showcase_num}
     */
    void readcountup(ShowcaseModel showcaseModel);

    /**
     * 예매수 1증가
     *
     * @param showcaseModel #{showcase_num}
     */
    void ordercountup(ShowcaseModel showcaseModel);

    /**
     * 예매수 1감소
     *
     * @param showcaseModel #{showcase_num}
     */
    void ordercountdown(ShowcaseModel showcaseModel);
}
