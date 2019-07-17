package org.protectedog.web.storyfunding;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.domain.FileDog;
import org.protectedog.service.domain.Funding;
import org.protectedog.service.domain.Participate;
import org.protectedog.service.file.FileService;
import org.protectedog.service.storyfunding.FundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/funding/*")
public class FundingController {

	/// Field
	@Autowired
	@Qualifier("fundingServiceImpl")
	private FundingService fundingService;

	@Autowired
	@Qualifier("fileServiceImpl")
	private FileService fileService;

	public FundingController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@Value("#{commonProperties['fileSF']}")
	String fileroot;

	@Value("#{commonProperties['funding']}")
	String boardCode;

	@Value("#{commonProperties['SFTermsOne']}")
	String SFTermsOne;

	@Value("#{commonProperties['SFTermsTwo']}")
	String SFTermsTwo;

	@Value("#{commonProperties['SFTermsThree']}")
	String SFTermsThree;

	@Value("#{commonProperties['SFTermsFour']}")
	String SFTermsFour;

	@Value("#{commonProperties['SFTermsFive']}")
	String SFTermsFive;

	/////////////// 약관보기 /////////////////////

	// 약관보기
	@RequestMapping(value = "getTerms", method = RequestMethod.GET)
	public String getTerms(@RequestParam("termsTitle") String termsTitle, @RequestParam("postNo") String postNo,
			Model model) throws Exception {

		System.out.println("/funding/getTerms");

		List<String> termsList = new ArrayList<String>();
		termsList.add(SFTermsOne);
		termsList.add(SFTermsTwo);
		termsList.add(SFTermsThree);
		termsList.add(SFTermsFour);
		termsList.add(SFTermsFive);
		if (termsTitle.equals("SFPost")) {
			termsTitle = "후원신청글";
		} else if (termsTitle.equals("SFVote")) {
			termsTitle = "투표하기";
		}

		model.addAttribute("termsList", termsList);
		model.addAttribute("termsTitle", termsTitle);
		model.addAttribute("postNo", postNo);
		return "forward:/funding/getTerms.jsp";
	}

	/////////////// FUNDING 후원신청게시판 /////////////////////

	// 펀딩 글 작성
	@RequestMapping(value = "addVoting", method = RequestMethod.GET)
	public String addVoting(HttpSession session) throws Exception {

		System.out.println("/funding/addVoting : GET");
		// 나중에 세션으로 변경//
		Funding funding = new Funding();
		String id = "user01";
		String nickName = "스캇";
		funding.setId(id);
		funding.setNickName(nickName);
		// 변경여기까지//

		return "redirect:/funding/addVoting.jsp";
	}

	// 펀딩 글 등록
	@RequestMapping(value = "addVoting", method = RequestMethod.POST)
	public String addVoting(@RequestParam("multiFile") ArrayList<String> multiFile,
			@ModelAttribute("funding") Funding funding, HttpSession session) throws Exception {

		System.out.println("/funding/addVoting : POST");

		// 나중에 세션으로 변경//
		String id = "user01";
		String nickName = "스캇";
		funding.setId(id);
		funding.setNickName(nickName);
		// 변경여기까지//

		int voteTargetCount = (int) (funding.getFundTargetPay() * 0.001);

		funding.setMainFile(multiFile.get(0));
		funding.setVoteTargetCount(voteTargetCount);

		System.out.println(funding);
		fundingService.addVoting(funding);

		List<FileDog> listFile = new ArrayList<FileDog>();

		// 파일디비에넣기
		for (String fileName : multiFile) {

			FileDog files = new FileDog();
			files.setBoardCode(boardCode);
			files.setFileName(fileName);
			files.setFileCode(0);
			files.setPostNo(funding.getPostNo());
			listFile.add(files);
		}
		fileService.addFile(listFile);

		return "redirect:/funding/getVoting?postNo=" + funding.getPostNo();
	}

	// 펀딩 글 확인
	@RequestMapping(value = "getVoting", method = RequestMethod.GET)
	public String getVoting(@RequestParam("postNo") int postNo, Model model) throws Exception {

		System.out.println("/funding/getVoting ");

		Funding funding = fundingService.getVoting(postNo);
		List<FileDog> file = fileService.getFile(postNo);

		model.addAttribute("file", file);
		model.addAttribute("funding", funding);

		return "forward:/funding/getVoting.jsp";
	}

	// 펀딩 글 수정작성
	@RequestMapping(value = "updateVoting", method = RequestMethod.GET)
	public String updateVoting(@RequestParam("postNo") int postNo, Model model) throws Exception {

		System.out.println("/funding/updateVoting : GET");
		// Business Logic

		Funding funding = fundingService.getVoting(postNo);

		List<FileDog> file = fileService.getFile(postNo);

		model.addAttribute("funding", funding);
		model.addAttribute("file", file);

		return "forward:/funding/updateVoting.jsp";
	}

	// 펀딩 글 수정등록
	@RequestMapping(value = "updateVoting", method = RequestMethod.POST)
	public String updateVoting(@ModelAttribute("funding") Funding funding,
			@RequestParam("multiFile") ArrayList<String> multiFile,
			@RequestParam("deleteFile") ArrayList<String> deleteFile, HttpSession session) throws Exception {

		System.out.println("/funding/updateVoting : POST");

		if (deleteFile != null) {

			for (String fileName : deleteFile) {
				FileDog files = new FileDog();
				files.setFileName(fileName);
				files.setPostNo(funding.getPostNo());

				fileService.delFile(files);
			}
		}
		if (multiFile.size() != 0) {
			List<FileDog> listFile = new ArrayList<FileDog>();
			// 파일디비에넣기
			for (String fileName : multiFile) {
				FileDog files = new FileDog();
				files.setBoardCode(boardCode);
				files.setFileName(fileName);
				files.setFileCode(0);
				files.setPostNo(funding.getPostNo());
				listFile.add(files);
			}
			fileService.addFile(listFile);
		}

		// 나중에 세션으로 변경//
		String id = "user01";
		String nickName = "스캇";
		funding.setId(id);
		funding.setNickName(nickName);

		List<FileDog> file = fileService.getFile(funding.getPostNo());
		funding.setMainFile(file.get(0).getFileName());
		// 변경여기까지//

		int voteTargetCount = (int) (funding.getFundTargetPay() * 0.001);
		funding.setVoteTargetCount(voteTargetCount);

		fundingService.updateVoting(funding);

		return "redirect:/funding/getVoting?postNo=" + funding.getPostNo();
	}

	// 펀딩 글 삭제
	@RequestMapping(value = "delVoting")
	public String delVoting(@RequestParam("postNo") int postNo, Model model) throws Exception {

		System.out.println("/funding/delVoting");

		fundingService.delVoting(postNo);

		return "forward:/funding/listVoting";
	}

	// 펀딩 글 리스트
	@RequestMapping(value = "listVoting")
	public String listVoting(@ModelAttribute("search") Search search, Model model, HttpSession session)
			throws Exception {

		System.out.println("/funding/listVoting : GET / POST");

		String originSearch = null;

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		if (search.getSearchKeyword() == null) {
			search.setSearchKeyword("");
		} else {
			if (!search.getSearchKeyword().equals("")) {
				originSearch = search.getSearchKeyword();
				String likeSearch = "%" + search.getSearchKeyword() + "%";
				search.setSearchKeyword(likeSearch);
			}
		}

		if (search.getSearchCondition() == null) {
			search.setSearchCondition("");
		}

		// User user = (User) session.getAttribute("user");

		Map<String, Object> map = fundingService.listVoting(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		search.setSearchKeyword(originSearch);

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/funding/listVoting.jsp";
	}

	/////////////// FUNDING 후원게시게시판 /////////////////////

	// 펀딩 글 리스트
	@RequestMapping(value = "listFunding")
	public String listFunding(@ModelAttribute("search") Search search, Model model, HttpSession session)
			throws Exception {

		System.out.println("/funding/listFunding : GET / POST");

		String originSearch = null;

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		if (search.getSearchKeyword() == null) {
			search.setSearchKeyword("");
		} else {
			if (!search.getSearchKeyword().equals("")) {
				originSearch = search.getSearchKeyword();
				String likeSearch = "%" + search.getSearchKeyword() + "%";
				search.setSearchKeyword(likeSearch);
			}
		}

		if (search.getSearchCondition() == null) {
			search.setSearchCondition("");
		}

		// User user = (User) session.getAttribute("user");

		Map<String, Object> map = fundingService.listFunding(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		search.setSearchKeyword(originSearch);

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/funding/listFunding.jsp";
	}
	
	
	/////////////// FUNDING 참여/////////////////////

	// 투표와 후원참여
	@RequestMapping(value = "addFund", method = RequestMethod.GET)
	public String addFund(@RequestParam("postNo") int postNo, HttpSession session) throws Exception {

		System.out.println("/funding/addfunding : GET");

		// participate 레코드 추가
		Participate participate = new Participate();
		participate.setPostNo(postNo);
		participate.setId("user01");
		participate.setNickName("스캇");
		participate.setStatusCode("1");

		fundingService.addParticipate(participate);

		// funding테이블 voter_count += 1
		Funding funding = new Funding();

		// 투표완료 될상황
		if (funding.getVoterCount() + 1 == funding.getVoteTargetCount()) {
			funding.setStatusCode("3");
		} else {
			funding.setStatusCode("1");
		}

		funding.setVoterCount(1);
		funding.setPostNo(postNo);
		fundingService.updateStatusCode(funding);

		return "redirect:/funding/getVoting?postNo=" + postNo;
	}
}
