package kh.project.dml.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.nimbusds.oauth2.sdk.util.StringUtils;

import io.jsonwebtoken.io.IOException;
import kh.project.dml.board.model.service.FpBoardService;
import kh.project.dml.board.model.vo.FpBoardParam;
import kh.project.dml.board.model.vo.FpBoardSelectReplyParam;
import kh.project.dml.board.model.vo.FpBoardVo;
import kh.project.dml.common.FileUpload;
import kh.project.dml.common.vo.Criteria;
import kh.project.dml.common.vo.FpPageMakerVo;

@Controller
@RequestMapping("/board")

public class FpBoardController {

	@Autowired
	private FpBoardService fpBoardServiceImpl;

	private static final String CURR_IMAGE_REPO_PATH = "C:\\workspace\\github\\DML\\src\\main\\webapp\\WEB-INF\\views\\board\\upload";

	@GetMapping("/list")
	public ModelAndView selectListboard(ModelAndView mv, Criteria cri) {
		int total = fpBoardServiceImpl.getTotalBoard(cri);
		mv.addObject("boardList", fpBoardServiceImpl.selectList(cri));
		FpPageMakerVo pageMake = new FpPageMakerVo(cri, total);

		mv.addObject("pageMaker", pageMake);
		mv.setViewName("board/list");
		return mv;
	}

	@GetMapping("/one")
	public ModelAndView selectOneboard(ModelAndView mv, Integer boardNo) {
		mv.addObject("boardone", fpBoardServiceImpl.selectOne(boardNo));
		mv.setViewName("board/one");
		return mv;
	}

	@GetMapping("/insert")
	public String form() {
		return "board/insert";
	}

	@PostMapping("/insert")
	public String insertDoBoard(RedirectAttributes redirectAttr, FpBoardVo vo) {
		String viewPage = "redirect:/";

		int result = fpBoardServiceImpl.insert(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 가입 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/board/insert";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 가입 됐습니다");
				viewPage = "redirect:/board/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}

	@GetMapping("/plusCount")
	@ResponseBody
	public Integer updatememberexset(FpBoardParam param) {
		return fpBoardServiceImpl.plusCount(param);
	}

	@PostMapping("/upload")
	@ResponseBody
	public Map<String, String> imageUpload(MultipartFile upload, HttpServletRequest request) {

		Map config = new HashMap();
		config.put("cloud_name", "db7cajuz1");
		config.put("api_key", "712589672878332");
		config.put("api_secret", "E-Gm0B7UZ3K_c_KYnJRfxHTPwX0");
		Cloudinary cloudinary = new Cloudinary(config);
		// cloudinary 사용을 위해 등록(properties 파일 이용)

		Map<String, String> result = new HashMap<String, String>();
		OutputStream out = null;
		// 파일이 비어있지 않고(비어 있다면 null 반환)
		MultipartFile file = upload;
		if (file != null) {
			// 파일 사이즈가 0보다 크고, 파일이름이 공백이 아닐때
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
//	            if (file.getContentType().toLowerCase().startsWith("image/")) {
				try {
					// 파일 이름 설정
					String fileName = file.getOriginalFilename();
					System.out.println("원래file이름: " + fileName);

					// 로컬 - 파일이 로컬 서버에 실제로 저장되는 경로
//	                  String uploadPath = request.getServletContext().getRealPath("/resources/ckimage/");
					// 로컬 - 저장되는 파일에 경로 설정
//	                  File uploadFile = new File(uploadPath);
//	                  if (!uploadFile.exists()) {
//	                     uploadFile.mkdirs();
//	                  }
					// 로컬 - 파일이름을 랜덤하게 생성
//	                  fileName = UUID.randomUUID().toString()+"_"+fileName;
//	                  System.out.println("바뀐file이름: "+ fileName);
					// 업로드 경로 + 파일이름을 줘서 데이터를 서버에 전송
//	                  uploadPath = uploadPath + "/" + fileName;

					// 로컬 - 저장되는 파일에 경로 설정
//	                  upload.transferTo(new File(uploadPath)); // 로컬 파일 저장

					// 로컬 - 파일이 연결되는 Url 주소 설정
//	                  String fileUrl = uploadPath;
//	                  System.out.println("fileUrl: "+ fileUrl);

					// 파일서버 - 파일 저장
//	                  Map res = cloudinary.uploader().upload(new File(uploadPath), ObjectUtils.emptyMap()); 
					File uploadedFile = new File(fileName);
					file.transferTo(uploadedFile);
					Map res = cloudinary.uploader().upload(uploadedFile, ObjectUtils.emptyMap());
					String cloudinaryUrl = res.get("url") == null ? "" : res.get("url").toString();
					System.out.println("cloudinaryUrl: " + cloudinaryUrl);
					System.out.println("파일 전송이 완료되었습니다.");
					result.put("uploaded", "1");
					result.put("fileName", fileName);
					result.put("url", cloudinaryUrl);
				} catch (Exception e) {
					// TODO: handle exception
				} finally {
				}

			}

//	         }
		}
		return result;
	}

	/*
	 * @PostMapping("/upload")
	 * 
	 * @ResponseBody public String fileUpload(HttpServletRequest request,
	 * HttpServletResponse response, MultipartHttpServletRequest multiFile) throws
	 * Exception {
	 * 
	 * // Json 객체 생성 JsonObject json = new JsonObject(); // Json 객체를 출력하기 위해
	 * PrintWriter 생성 PrintWriter printWriter = null; OutputStream out = null; //
	 * 파일을 가져오기 위해 MultipartHttpServletRequest 의 getFile 메서드 사용 MultipartFile file =
	 * multiFile.getFile("upload");
	 * 
	 * // 파일이 비어있지 않고(비어 있다면 null 반환) if (file != null) { // 파일 사이즈가 0보다 크고, 파일이름이
	 * 공백이 아닐때 if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
	 * if (file.getContentType().toLowerCase().startsWith("image/")) {
	 * 
	 * try { // 파일 이름 설정 String fileName = file.getName(); // 바이트 타입설정 byte[] bytes
	 * = null; // 파일을 바이트 타입으로 변경 try { bytes = file.getBytes(); } catch
	 * (java.io.IOException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } // 파일이 실제로 저장되는 경로 String uploadPath =
	 * request.getServletContext().getRealPath("/resources/ckimage/"); // 저장되는 파일에
	 * 경로 설정 File uploadFile = new File(uploadPath); if (!uploadFile.exists()) {
	 * uploadFile.mkdirs(); } // 파일이름을 랜덤하게 생성 fileName =
	 * UUID.randomUUID().toString(); // 업로드 경로 + 파일이름을 줘서 데이터를 서버에 전송 uploadPath =
	 * uploadPath + "/" + fileName; out = new FileOutputStream(new
	 * File(uploadPath)); out.write(bytes);
	 * 
	 * // 클라이언트에 이벤트 추가 printWriter = response.getWriter();
	 * response.setContentType("text/html");
	 * 
	 * // 파일이 연결되는 Url 주소 설정 String fileUrl = request.getContextPath() +
	 * "/resources/ckimage/" + fileName;
	 * 
	 * // 생성된 jason 객체를 이용해 파일 업로드 + 이름 + 주소를 CkEditor에 전송
	 * json.addProperty("uploaded", 1); json.addProperty("fileName", fileName);
	 * json.addProperty("url", fileUrl); printWriter.println(json); } catch
	 * (IOException e) { e.printStackTrace(); } finally { if (out != null) {
	 * out.close(); } if (printWriter != null) { printWriter.close(); } } } } }
	 * return null; }
	 */
	@PostMapping("/selectReply")
	@ResponseBody
	public FpBoardVo selectReplyBoard(FpBoardSelectReplyParam param) {
		return fpBoardServiceImpl.selectReply(param);
	}

	@GetMapping("/update")
	public ModelAndView updateboard(ModelAndView mv, int boardNo) {
		mv.addObject("boardone", fpBoardServiceImpl.selectOne(boardNo));
		mv.setViewName("board/update");
		return mv;
	}

	@PostMapping("/update")
	public String updateDoBoard(RedirectAttributes redirectAttr, FpBoardVo vo) {
		String viewPage = "redirect:/";
		int result = fpBoardServiceImpl.update(vo);
		// ((ModelAndView) redirectAttr).addObject("boardone",
		// fpBoardServiceImpl.selectOne(vo.getBoardNo()));
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/board/update";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 됐습니다");
				viewPage = "redirect:/board/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}

	@PostMapping("/delete")
	public String deleteDoBoard(RedirectAttributes redirectAttr, int boardNo) {
		String viewPage = "redirect:/";
		int result = fpBoardServiceImpl.delete(boardNo);
		try {
			if (result < 1) {
				viewPage = "redirect:/board/list";// delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				viewPage = "redirect:/board/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}

}
