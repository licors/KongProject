package kong2.common;

//@requestParam 용 pagingAction
public class PagingActionRequestParam {

	private static int currentPage;   // 현재페이지
	private static int totalCount;	 // 전체 게시물 수
	private static int totalPage;	 // 전체 페이지 수
	private static int blockCount;	 // 한 페이지의  게시물의 수
	private static int blockPage;	 // 한 화면에 보여줄 페이지 수
	private static int startCount;	 // 한 페이지에서 보여줄 게시글의 시작 번호
	private static int endCount;	 // 한 페이지에서 보여줄 게시글의 끝 번호
	private static int startPage;	 // 시작 페이지
	private static int endPage;	 // 마지막 페이지
	private static String mappingName;

	private static StringBuffer pagingHtml;

	public static StringBuffer getPagingHtml() {
		return pagingHtml;
	}
	
	public static int getEndCount() {
		return endCount;
	}
	
	public static int getStartCount() {
		return startCount;
	}
	// 페이징 생성자
	public static void PagingAction(int param_currentPage, int param_totalCount, int param_blockCount,
			int param_blockPage, String param_mappingName) { 

		blockCount = param_blockCount;
		blockPage = param_blockPage;
		currentPage = param_currentPage;
		totalCount = param_totalCount;
		mappingName = param_mappingName;

		// 전체 페이지 수
		totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if (totalPage == 0) {
			totalPage = 1;
		}

		// 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}

		// 현재 페이지의 처음과 마지막 글의 번호 가져오기.
		startCount = (currentPage - 1) * blockCount;
		endCount = startCount + blockCount - 1;

		// 시작 페이지와 마지막 페이지 값 구하기.
		startPage = (Integer) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;

		// 마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (endPage > totalPage) {
			endPage = totalPage;
		}

		// 이전 block 페이지
		pagingHtml = new StringBuffer(); 
		if (currentPage > blockPage) {
			pagingHtml.append("<a href=" + mappingName + "&currentPage=" + (startPage - 1) + ">");
			pagingHtml.append("&lt;");
			pagingHtml.append("</a>");
		}

		//페이지 번호.현재 페이지는 빨간색으로 강조하고 링크를 제거.
		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPage) {
				pagingHtml.append("<strong>");
				pagingHtml.append(i);
				pagingHtml.append("</strong>");
			} else {
				pagingHtml.append("<a href=" + mappingName + "&currentPage=");
				pagingHtml.append(i);
				pagingHtml.append(">");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
			}
		}

		// 다음 block 페이지
		if (totalPage - startPage >= blockPage) {
			pagingHtml.append("<a href=" + mappingName + "&currentPage=" + (endPage + 1) + ">");
			pagingHtml.append("&gt;");
			pagingHtml.append("</a>");
		}
	}
}