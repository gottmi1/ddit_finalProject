package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class PaginationInfoVO<T> {
	private int totalRecord; 		// 총 게시글 수
	private int totalPage;			// 총 페이지 수
	private int currentPage;		// 현재 페이지
	private int screenSize = 10;	// 페이지 당 게시글 수
	private int blockSize = 5;		// 페이지 블록수
	private int startRow;			// 시작 row
	private int endRow;				// 끝 row
	private int startPage;			// 시작페이지
	private int endPage;			// 끝 페이지
	private List<T> dataList;		// 결과를 넣을 데이터 리스트
	private T searchVO;				// 검색 또는 이외에 파라미터 처리할 VO
	private String searchType; 		// 검색 타입
	private String searchWord;		// 검색 단어
	
	private int proNo;
	
	private int empNo;
	private int mailMenu;
	
	private int receiveCategory;
	private int sendCategory;
	
	private int workStatus;
	
	public PaginationInfoVO() {}
	
	public PaginationInfoVO(int screenSize, int blockSize) {
		super();
		this.blockSize = blockSize;
		this.screenSize = screenSize;
	}
	
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		// ceil은 올림
		totalPage = (int)Math.ceil(totalRecord / (double)screenSize);
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;			// 현재 페이지
		endRow = currentPage * screenSize;		// 끝 row  = 현재 페이지 * 한 페이지 당 게시글 수
		startRow = endRow - (screenSize -1);	// 시작 row = 끝  row - (한 페이지 당 겟글 수 -1)
		
		// 마지막 페이지 - (현재페이지 + (페이지 블로 ㄱ사이즈 -1)) / 페이지 블록 사이즈 *  페이지 블록 사이즈
		// 페이지 마다 실수 계산이 아닌 정수 계산을 이용해 endPage fmf 구한다.
		endPage = (currentPage + (blockSize - 1))/ blockSize * blockSize;
		startPage = endPage - (blockSize - 1);
	
	}
	// 페이지 블록 그룹을 생성(html 코드로 이루어진 그룹)
	public String getPagingHTML() {
		StringBuffer html = new StringBuffer();
		// startPage는 1,6,11 이런 숫자로 증가해서 올립니다.
		// 1-5범위 안에 있는 경우는 Prev가 생성되지 않습니다
		// 6범위부터 Prev가 만,들어지는 조건이
		html.append("<ul class='pagination pagination-md m-0 float-right'>");
		
		
		if(startPage >1) {
			html.append("<li class='page-item'><a href='' class='page-link' data-page='" // data-page '-'기준으로  오른쪽 키, 왼쪽 속성을 적극 활용하기
					+ (startPage - blockSize) + "'>Prev</a></li>");
		}
		// 반복문 내 조건은 총 페이지가 있고 현재 페이지에따라서 endPage값이 결정됩니다.
		// 총 페이지가 14개로 현재 페이지가 9페이지라면 넘어가야할  페이지가 남아있는 것이기 때문에 endPage만큼 반복되고
		// 넘어가야할 페이지가 존재하지 않는 상태라면 마지막 페이지가 포함되어 있는 block영역이므로 totalPage만큼 반복됨
		for (int i = startPage; i <= (endPage < totalPage ? endPage : totalPage); i++) {
			if(i == currentPage) {
				html.append("<li class='page-item active'><span class='page-link'>" + i + "</span></li>");
			}else {
				html.append("<li class='page-item'><a href='' class='page-link' data-page='" + i + "'>" + i + "</a></li>");
			}
		}
		if(endPage < totalPage) {
			html.append("<li class = 'page-item'><a href='' class='page-link' data-page='" + (endPage+1) + "'>Next</a></li>");
		}
		
		html.append("</ul>");
		return html.toString();
	}
}
