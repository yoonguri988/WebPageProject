package action.Member;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Board;
import model.BoardDao;
import model.Comment;
import model.CommentDao;
import model.Member;
import model.MemberDao;
import model.MyList;
import model.MyListDao;
import model.PlayList;
import model.PlayListDao;
import model.QAlist;
import model.QAlistDao;
import model.Warn;
import model.WarnDao;

public class MemberAllAction {
	protected String login;
	public ActionForward login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String msg = "아이디 및 비밀번호가 틀렸습니다.";
		String url = "loginForm.do";
		Member mem = new MemberDao().selectOne(id);
		if(mem!=null) {
			if(pass.equals(mem.getPass())) {
				request.getSession().setAttribute("login",id);
				msg = mem.getNick()+"님, 안녕하세요!";
				url = "main.do";
			} else {
				msg = "아이디 또는 비밀번호를 틀리셨습니다.";
			}
		}
		request.setAttribute("msg",	msg);
		request.setAttribute("url",	url);
		return new ActionForward(false, "../../alert.jsp");
	}
	public ActionForward qaone(HttpServletRequest request, HttpServletResponse response) throws Exception {
		QAlistDao qadao = new QAlistDao();
		int maxnum = qadao.maxnum();
		int randomnum = (int)(Math.random()*maxnum)+1;
		QAlist qa = new QAlistDao().selectOne(randomnum);
		String q = qa.getQuestion();
		String a = qa.getAnswer();
		request.setAttribute("q", q);
		request.setAttribute("a", a);
		return new ActionForward();
	}
	public ActionForward join(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new Member();
		MemberDao dao = new MemberDao();
		String msg=null;
		String url=null;
		int maxnum =dao.maxmemnum();
		mem.setMemnum(++maxnum);
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setNick(request.getParameter("nick"));
		mem.setTel(request.getParameter("tel")); 
		mem.setChk(Integer.parseInt(request.getParameter("chk")));
		msg="존재하는 아이디및 닉네임을 입력하였습니다.";
		url="joinForm.do";
		if(dao.insert(mem)>0){
			msg="즐거운 하루 보내세요!";
			url="main.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return new ActionForward();
	}
	public ActionForward logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String)request.getSession().getAttribute("login");
		request.getSession().invalidate();  
		request.setAttribute("msg", id+"님! 늘 감사합니다!");
		request.setAttribute("url", "main.do");
		return new ActionForward(false, "../../alert.jsp");
	}
	public ActionForward info(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String) request.getSession().getAttribute("login");
		String id = request.getParameter("id");
		if(login==null||login.trim().equals("")) {
			request.setAttribute("msg", "로그인 후 이용해주세요");
			request.setAttribute("url", "loginForm.do");
			return new ActionForward(false,"../../alert.jsp");
		}else {
			if(!login.equals("admin")&&id!=null&&!login.equals(id)) {
				request.setAttribute("msg", "내 정보만 확인 할 수 있어요");
				request.setAttribute("url", "main.do");
				return new ActionForward(false,"../../alert.jsp");
			}
			int limit = 5;
			int pageNum= 1;
			try{
				pageNum=Integer.parseInt(request.getParameter("pageNum"));
			}catch(NumberFormatException e){}
			
			int memnum=new MemberDao().select_memnum_id(login);
			MyListDao mldao= new MyListDao();
			int mlcount = mldao.mlcount(memnum);
			
			int maxpage = (int)((double)mlcount/limit+0.95);
			int startpage = ((int)(pageNum/10.0+0.9)-1)*10+1;
			int endpage = startpage+9;
			
			if (endpage>maxpage) endpage=maxpage; 
			int mlnum = mlcount - (pageNum -1)*limit;
			List<MyList> mylist = new MyListDao().selectOne_memnum(memnum,pageNum,limit);
			
			
			
			Member info = new MemberDao().selectOne(id);
			request.setAttribute("info", info);
			request.setAttribute("mylist", mylist);
			request.setAttribute("mlnum", mlnum);
			request.setAttribute("maxpage", maxpage);
			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage); 
			request.setAttribute("pageNum", pageNum);
		}
		return new ActionForward();
	}
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setNick(request.getParameter("nick"));
		mem.setTel(request.getParameter("tel"));
		MemberDao dao = new MemberDao();
		Member dbmem = dao.selectOne(mem.getId());
		login = (String)request.getSession().getAttribute("login");
		String msg = "잘못된 비밀번호입니다.";
		String url = "updateForm.do?id="+mem.getId();
		if(login.equals("admin")||mem.getPass().equals(dbmem.getPass())) {
			if(dao.update(mem)>0) {
				msg = "회원 수정에 성공하였습니다.";
				if(login.equals("admin")) {
					url = "list.do";
				}
				else {
					url = "mypageForm.do?id="+mem.getId();
				}
			}else {
				msg = "안됩니다.";
				url = "main.do";
			}
		}
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login = (String)request.getSession().getAttribute("login");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String msg = null;
		String url = null;
		MemberDao dao = new MemberDao();
		Member dbmem = dao.selectOne(id);
		if(!login.equals("admin")&&!login.equals(id)) {
			msg = "자신만 탈퇴 할 수 있습니다.";
			url = "mypageForm.do?id="+login;
		}else if(id.equals("admin")){
			msg= "관리자는 탈퇴가 불가능 합니다.";
			url="list.do";
		}else {
				int result = dao.delete(id);
				if(result>0){
					if(login.equals("admin")){
						msg=dbmem.getNick()+"님을 강제 탈퇴 시켰습니다";
						url="list.do";
					}else{
						msg=dbmem.getNick()+"님, 그동안 사용해주셔서 감사합니다.";
						url="main.do";
						request.getSession().invalidate();
					}
				}else{
					msg=id+"님, 탈퇴에 실패하셨습니다.";
					if(login.equals("admin")){
						url="list.do";
					}else{
						url="mypageForm.do?id="+id;
					}
				}
		}
		request.setAttribute("msg",msg);
		request.setAttribute("url",url);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward memberlist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDao dao = new MemberDao();
		int limit = 8;
		int pageNum= 1;
		try{
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}catch(NumberFormatException e){}
		String id=null;
		int membercount = dao.membercount();
		List<Member> list = dao.list(pageNum,limit);

		int maxpage = (int)((double)membercount/limit+0.95);
		int startpage = ((int)(pageNum/10.0+0.9)-1)*10+1;//���� ������ ��ȣ
		int endpage = startpage+9;//
		
		if (endpage>maxpage) endpage=maxpage; 
		int membernum = membercount - (pageNum -1)*limit;
		
		request.setAttribute("membercount", membercount);
		request.setAttribute("list", list);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("membernum", membernum);
		request.setAttribute("pageNum", pageNum);
		return new ActionForward();
	}
	public ActionForward warn(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		MemberDao dao = new MemberDao();
		String msg = null;
		String url = "list.do";
		int cnt = dao.selectOne(id).getWarncnt();
		if(cnt>1) {
			if(dao.deadmemup(id)) {
				msg="영구 탈퇴가 되었습니다.";
			}else {
				msg="영구 탈퇴에 실패 하였습니다.";
			}
		}else {
			if(dao.warncntup(id)) {
				msg="경고를 주었습니다.";
			}else {
				msg="경고를 실패하였습니다.";
			}
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward search(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String id = request.getParameter("id");
		if(id==null) {
			return idSearch(request,tel,name);
		}else {
			return pwSearch(request,tel,name,id);
		}
	}
	private ActionForward idSearch(HttpServletRequest request, String tel, String name) {
		String id = new MemberDao().idSearch(name,tel);
		if(id!=null&&!id.trim().equals("")){
			request.setAttribute("id", id.substring(0,id.length()-2));
			return new ActionForward();
		}else {
			request.setAttribute("msg", "아이디를 찾을수 없습니다.");
			request.setAttribute("url", "idForm.do");
			return new ActionForward(false,"../../alert.jsp");
		}
	}
	private ActionForward pwSearch(HttpServletRequest request, String tel, String name,String id) {
		String pw = new MemberDao().passSearch(id,name,tel);
		if(pw!=null&&!pw.trim().equals("")){
			request.setAttribute("pass", pw.substring(2,pw.length()));
			return new ActionForward();
		}else {
			request.setAttribute("msg", "비밀번호를 찾을 수 없습니다.");
			request.setAttribute("url", "pwForm.do");
			return new ActionForward(false,"../../alert.jsp");
		}
	}
	public ActionForward password(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String) request.getSession().getAttribute("login");
		boolean opener = false;
		boolean closer = false;
		String msg="기존 비밀번호가 맞지 않습니다.";
		String url="passwordForm.do"; 
		if(login==null||login.trim().equals("")){
			opener=true;
			closer=true;
			msg="로그인후 사용해 주세요";
			url="loginForm.do";
		}else{
			String pass = request.getParameter("pass");
			String chgpass = request.getParameter("chgpass");
			MemberDao dao = new MemberDao();
			Member mem = dao.selectOne(login);
			if(mem.getPass().equals(pass)){
				closer=true;
				if(dao.updatePass(login,chgpass)>0){
					msg="비밀번호가 변경되었습니다.";
					url="mypageForm.do?id="+login;
					opener=true;
				}else{
					msg="비밀번호 변경에 실패하였습니다.";
				}
			}
		}
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		request.setAttribute("opener", opener);
		request.setAttribute("closer", closer);
		return new ActionForward();
	}
	public ActionForward password_reset(HttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean opener = false;
		boolean closer = true;
		String msg="비밀번호 변경에 실패하였습니다.";
		String reffer = (String)request.getHeader("REFERER");
		String url=reffer; 
		String id = request.getParameter("id");
		String chgpass = request.getParameter("chgpass");
		MemberDao dao = new MemberDao();
		if(dao.updatePass(id,chgpass)>0){
			msg="비밀번호가 변경되었습니다.";
			url="loginForm.do";
			opener=true;
		}
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		request.setAttribute("opener", opener);
		request.setAttribute("closer", closer);
		return new ActionForward();
	}
	public ActionForward write(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException {
				BoardDao bdao = new BoardDao();
				String login = (String)request.getSession().getAttribute("login");
				String uploadpath = request.getServletContext().getRealPath("/")
						+"model2/board/file/";
				String msg="게시글 작성 실패";
				String url="writeForm.do";
				try {
					File f = new File(uploadpath);
					if(!f.exists()) f.mkdir();
					MultipartRequest multi = new MultipartRequest
						(request,uploadpath,10*1024*1024,"utf-8");
					Board b = new Board();
					b.setId(login);
					b.setBoardtype(Integer.parseInt(multi.getParameter("boardtype")));
					b.setBoardcategory(Integer.parseInt(multi.getParameter("boardcategory")));
					b.setTitle(multi.getParameter("title"));
					b.setContent(multi.getParameter("content"));
					b.setFile1(multi.getFilesystemName("file1"));
					int num = bdao.maxnum();
					b.setBoardnum(++num);
					b.setGrp(num);
					if(bdao.insert(b)){
						msg ="게시글 작성 성공";
						url ="list.do";
					}
				}catch(IOException e) {
					throw new ServletException(e);
				}
				request.setAttribute("msg", msg);
				request.setAttribute("url", url);
				return new ActionForward(false, "../../alert.jsp");
			}
	public ActionForward boardlist
	(HttpServletRequest request,HttpServletResponse response) {
		BoardDao bdao = new BoardDao();
		int limit = 8;
		int pageNum= 1;
		int boardcategory =0;
		int boardtype =0;
		try{
			boardcategory = Integer.parseInt(request.getParameter("boardcategory"));
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
			boardtype = Integer.parseInt(request.getParameter("boardtype"));
		}catch(NumberFormatException e){}
		
		int boardcount = bdao.boardcount(boardtype,boardcategory);
		List<Board> list = bdao.boardlist(boardtype,boardcategory,pageNum,limit);
		
		List<String> nicklist = new ArrayList<String>();
		for (int i = 0; i <list.size(); i++) {	
			nicklist.add(new MemberDao().selectOne(list.get(i).getId()).getNick());
		}

		int maxpage = (int)((double)boardcount/limit+0.95);
		int startpage = ((int)(pageNum/10.0+0.9)-1)*10+1;
		int endpage = startpage+9;
		
		if (endpage>maxpage) endpage=maxpage; 
		int boardnum = boardcount - (pageNum -1)*limit;
		
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list", list);
		request.setAttribute("nicklist", nicklist);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("pageNum", pageNum);
		return new ActionForward();
	}
	public ActionForward boardinfo
	(HttpServletRequest request,HttpServletResponse response) {
		BoardDao bdao = new BoardDao();
		String login = (String) request.getSession().getAttribute("login");
		int boardtype = Integer.parseInt(request.getParameter("boardtype"));
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		int boardcategory = Integer.parseInt(request.getParameter("boardcategory"));
		Board b = bdao.selectOne(boardnum,boardtype,boardcategory);
		String nick = new MemberDao().selectOne(b.getId()).getNick();
		int memnum = new MemberDao().selectOne(login).getMemnum();
		if(request.getRequestURI().contains("info.do")) {
			bdao.readcntadd(boardnum);
		}
		request.setAttribute("b", b);
		request.setAttribute("nick", nick);
		request.setAttribute("memnum", memnum);
		return new ActionForward();
	}
	public ActionForward boardupdate
	(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String path = request.getServletContext().getRealPath("/")+"model2/board/file/";
		MultipartRequest multi = new MultipartRequest
				(request,path,10*1024*1024,"utf-8");
		Board b = new Board();
		BoardDao bdao = new BoardDao();
		b.setBoardnum(Integer.parseInt(multi.getParameter("boardnum")));
		b.setBoardtype(Integer.parseInt(multi.getParameter("boardtype")));
		b.setBoardcategory(Integer.parseInt(multi.getParameter("boardcategory")));
		System.out.println(multi.getParameter("id"));
		b.setId(multi.getParameter("id"));
		b.setTitle(multi.getParameter("title"));
		b.setContent(multi.getParameter("content"));
		String msg="글 수정에 실패하였습니다.";
		String url="updateForm.do?boardtype="+b.getBoardtype()+"&boardnum="+b.getBoardnum()+"&boardcategory="+b.getBoardcategory();
		
		if(bdao.update(b)){
			msg="글 수정에 성공하였습니다.";
			url = "info.do?boardtype="+b.getBoardtype()+"&boardnum="+b.getBoardnum()+"&boardcategory="+b.getBoardcategory();
		}
		request.setAttribute("msg",msg);
		request.setAttribute("url",url);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward boarddelete
	(HttpServletRequest request,HttpServletResponse response) throws Exception {
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		int boardtype = Integer.parseInt(request.getParameter("boardtype"));
		int boardcategory = Integer.parseInt(request.getParameter("boardcategory"));

		BoardDao bdao = new BoardDao();
		String msg=null;
		String url=null;
		Board b = bdao.selectOne(boardnum,boardtype,boardcategory);
		if(b==null){
			msg="이미 삭제된 글 입니다.";
			url="list.do?boardtype="+boardtype;
		}else{
			if(bdao.delete(boardnum)){
				msg="글 삭제에 성공하였습니다";
				url="list.do?boardtype="+boardtype;
			}else{
				msg="글 삭제에 실패하였습니다.";
				url="info.do?boardnum="+boardnum;
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward imgwrite
	(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String uploadpath = request.getServletContext().getRealPath("/")
				+"model2/imageboard/file/";
		String msg="이미지글 생성 실패";
		String url="writeForm.do";
		BoardDao bdao = new BoardDao();
		login = (String)request.getSession().getAttribute("login");
		String id = request.getParameter("id");
		try {
			File f = new File(uploadpath);
			if(!f.exists()) f.mkdir();
			MultipartRequest multi = new MultipartRequest
				(request,uploadpath,10*1024*1024,"utf-8");
			Board b = new Board();
			b.setId(multi.getParameter("id"));
			b.setBoardtype(Integer.parseInt(multi.getParameter("boardtype")));
			b.setBoardcategory(0);
			b.setTitle(multi.getParameter("title"));
			b.setContent(multi.getParameter("content"));
			String fname = multi.getFilesystemName("file1");
			BufferedImage bi = ImageIO.read(new File(uploadpath+fname));
			int width = 400;
			int height = 600;
			BufferedImage thumb = new BufferedImage
					(width, height, BufferedImage.TYPE_INT_RGB);
			Graphics2D g = thumb.createGraphics();
			g.drawImage(bi, 0, 0, width, height, null);
			f = new File(uploadpath+"sm_"+fname);
			ImageIO.write(thumb,"jpg",f);
			b.setFile1(fname);
			int num = bdao.maxnum();
			b.setBoardnum(++num);
			b.setGrp(num);
			if(bdao.insert(b)){
				msg ="게시글 작성 성공";
				url ="list.do";
			}
		}catch(IOException e) {
			throw new ServletException(e);
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward imglist
	(HttpServletRequest request,HttpServletResponse response) {
		BoardDao bdao = new BoardDao();
		int limit = 8;
		int pageNum= 1;
		int boardcategory =0;
		int boardtype =2;
		try{
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}catch(NumberFormatException e){}
		
		int boardcount = bdao.boardcount(boardtype,boardcategory);
		List<Board> list = bdao.boardlist(boardtype,boardcategory,pageNum,limit);

		int maxpage = (int)((double)boardcount/limit+0.95);
		int startpage = ((int)(pageNum/10.0+0.9)-1)*10+1;
		int endpage = startpage+9;
		
		if (endpage>maxpage) endpage=maxpage; 
		int boardnum = boardcount - (pageNum -1)*limit;
		
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list", list);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("pageNum", pageNum);
		return new ActionForward();
	}
	public ActionForward imginfo
	(HttpServletRequest request,HttpServletResponse response) {
		BoardDao bdao = new BoardDao();
		int boardtype = Integer.parseInt(request.getParameter("boardtype"));
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		int boardcategory = Integer.parseInt(request.getParameter("boardcategory"));

		Board b = bdao.selectOne(boardnum,boardtype,boardcategory);
		String nick = new MemberDao().selectOne(b.getId()).getNick();
		if(request.getRequestURI().contains("info.do")) {
			bdao.readcntadd(boardnum);
		}
		request.setAttribute("b", b);
		request.setAttribute("nick", nick);
		return new ActionForward();
	}
	public ActionForward imgupdate
	(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String path = request.getServletContext().getRealPath("/")+"model2/imageboard/file/";
		MultipartRequest multi = new MultipartRequest(request,path,10*1024*1024,"utf-8");
		Board b = new Board();
		BoardDao bdao = new BoardDao();
		b.setBoardnum(Integer.parseInt(multi.getParameter("boardnum")));
		b.setBoardtype(Integer.parseInt(multi.getParameter("boardtype")));
		b.setBoardcategory(0);
		b.setId(multi.getParameter("id"));
		b.setTitle(multi.getParameter("title"));
		b.setContent(multi.getParameter("content"));
		b.setFile1(multi.getFilesystemName("file1"));
		String msg="글 수정에 실패하였습니다.";
		String url="updateForm.do?boardtype="+b.getBoardtype()+"&boardnum="+b.getBoardnum()+"&boardcategory="+b.getBoardcategory();
		if(bdao.update(b)){
			msg="글 수정에 성공하였습니다.";
			url = "info.do?boardtype="+b.getBoardtype()+"&boardnum="+b.getBoardnum()+"&boardcategory="+b.getBoardcategory();
		}
		request.setAttribute("msg",msg);
		request.setAttribute("url",url);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward imgdelete
	(HttpServletRequest request,HttpServletResponse response) throws IOException {
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		int boardtype = Integer.parseInt(request.getParameter("boardtype"));
		int boardcategory = Integer.parseInt(request.getParameter("boardcategory"));

		BoardDao bdao = new BoardDao();
		String msg=null;
		String url=null;
		Board b = bdao.selectOne(boardnum,boardtype,boardcategory);
		if(b==null){
			msg="이미 삭제된 글 입니다.";
			url="list.do?boardtype="+boardtype;
		}else{
			if(bdao.delete(boardnum)){
				msg="글 삭제에 성공하였습니다";
				url="list.do?boardtype="+boardtype;
			}else{
				msg="글 삭제에 실패하였습니다.";
				url="info.do?boardtype="+boardtype+"&boardnum="+boardnum;
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward playwrite
	(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String msg="음악목록글 생성 실패";
		String url="writeForm.do";
		PlayListDao pldao = new PlayListDao();
		login = (String)request.getSession().getAttribute("login");
		try {
			PlayList pl = new PlayList();
			int listnum = pldao.maxnum();
			pl.setListnum(++listnum);
			pl.setYoutubeurl(request.getParameter("youtubeurl"));
			if(pldao.insert(pl)){
				msg ="게시글 작성 성공";
				url ="list.do";
			}
		}catch(Exception e) {
			throw new ServletException(e);
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward playlist
	(HttpServletRequest request,HttpServletResponse response) {
		PlayListDao pldao = new PlayListDao();
		int limit = 8;
		int pageNum= 1;
		try{
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}catch(NumberFormatException e){}
		
		int listcount = pldao.boardcount();
		//List<PlayList> list = pldao.boardlist(pageNum,limit);

		String id = (String)request.getSession().getAttribute("login");
		//mylist 테이블에  memnum 같다는 조건에 listnum있으면
		int memnum = new MemberDao().select_memnum_id(id);
		List<PlayList> list= pldao.boardlist(memnum,pageNum,limit);
		
		
		List<PlayList> youtubeimg = pldao.youtubeimg();
		int maxpage = (int)((double)listcount/limit+0.95);
		int startpage = ((int)(pageNum/10.0+0.9)-1)*10+1;
		int endpage = startpage+9;
		
		if (endpage>maxpage) endpage=maxpage; 
		int listnumber = listcount - (pageNum -1)*limit;
		
		request.setAttribute("youtubeimg", youtubeimg);
		request.setAttribute("listcount", listcount);
		request.setAttribute("list", list);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("listnumber", listnumber);
		request.setAttribute("pageNum", pageNum);
		return new ActionForward();
	}
	public ActionForward playinfo
	(HttpServletRequest request,HttpServletResponse response) {
		PlayListDao pldao = new PlayListDao();
		int listnum = Integer.parseInt(request.getParameter("listnum"));
		PlayList pl = pldao.select_info(listnum);
		request.setAttribute("pl", pl);
		return new ActionForward();
	}
	public ActionForward playupdate
	(HttpServletRequest request,HttpServletResponse response) throws Exception {
		PlayList pl = new PlayList();
		PlayListDao pldao = new PlayListDao();
		pl.setListnum(Integer.parseInt(request.getParameter("listnum")));
		pl.setYoutubeurl(request.getParameter("youtubeurl"));
		String msg="글 수정에 실패하였습니다.";
		String url="updateForm.do?listnum="+pl.getListnum();
		if(pldao.update(pl)){
			msg="글 수정에 성공하였습니다.";
			url = "info.do?listnum="+pl.getListnum();
		}
		request.setAttribute("msg",msg);
		request.setAttribute("url",url);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward playdelete
	(HttpServletRequest request,HttpServletResponse response) throws IOException {
		int listnum = Integer.parseInt(request.getParameter("listnum"));
		PlayListDao pldao = new PlayListDao();
		String msg=null;
		String url=null;
		PlayList pl = pldao.selectOne(listnum);
		if(pl==null){
			msg="이미 삭제된 글 입니다.";
			url="list.do?listnum="+listnum;
		}else{
			if(pldao.delete(listnum)){
				msg="글 삭제에 성공하였습니다";
				url="list.do?listnum="+listnum;
			}else{
				msg="글 삭제에 실패하였습니다.";
				url="info.do?listnum="+listnum;
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward warnwrite
	(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		int memnum = Integer.parseInt(request.getParameter("memnum"));
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));//21
		String msg="신고 실패";
		String url="writeForm.do?boardnum="+boardnum+"&id="+id+"&memnum="+memnum;
		WarnDao wdao = new WarnDao();
		Warn w = new Warn();
		try {
			int warnnum = wdao.maxnum();
			w.setWarnnum(++warnnum);
			w.setMemnum(memnum);
			w.setBoardnum(boardnum);
			w.setTitle(request.getParameter("title"));
			w.setContent(request.getParameter("content"));
			if(wdao.insert(w)){
				msg ="신고되었습니다.";
				url ="list.do";
			}
		}catch(Exception e) {
			throw new ServletException(e);
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward warnlist
	(HttpServletRequest request,HttpServletResponse response) {
		WarnDao wdao = new WarnDao();
		int limit = 8;
		int pageNum= 1;
		int memnumsort=0;
		try{
			memnumsort=Integer.parseInt(request.getParameter("memnumsort"));
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}catch(NumberFormatException e){}
		
		login = (String)request.getSession().getAttribute("login");//id
		int mymemnum = new MemberDao().selectOne(login).getMemnum();
		int warncount = wdao.boardcount(memnumsort);
		List<Warn> list = wdao.boardlist(memnumsort,pageNum,limit);
		
		int maxpage = (int)((double)warncount/limit+0.95);
		int startpage = ((int)(pageNum/10.0+0.9)-1)*10+1;
		int endpage = startpage+9;
		
		if (endpage>maxpage) endpage=maxpage; 
		int warnnum = warncount - (pageNum -1)*limit;
		
		request.setAttribute("warncount", warncount);
		request.setAttribute("list", list);
		request.setAttribute("mymemnum", mymemnum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("warnnum", warnnum);
		request.setAttribute("pageNum", pageNum);
		return new ActionForward();
	}
	public ActionForward warninfo
	(HttpServletRequest request,HttpServletResponse response) {
		WarnDao wdao = new WarnDao();
		int warnnum = Integer.parseInt(request.getParameter("warnnum"));
		Warn w = wdao.selectOne(warnnum);
		String id = new MemberDao().select_id(w.getMemnum());
		String nick = new MemberDao().select_nick(w.getMemnum());
		request.setAttribute("w", w);
		request.setAttribute("id", id);
		request.setAttribute("nick",nick);
		return new ActionForward();
	}
	public ActionForward warnstate
	(HttpServletRequest request,HttpServletResponse response) {
		int warnnum = Integer.parseInt(request.getParameter("warnnum"));
		WarnDao wdao = new WarnDao();
		String msg="처리 실패";
		String url="info.do?warnnum="+warnnum;
		if(wdao.stateadd(warnnum)){
			msg="완료처리 하였습니다.";
			url = "list.do";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("url",url);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward noticewrite
	(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String msg="공지글 등록 실패";
		String url="writeForm.do";
		BoardDao bdao = new BoardDao();
		Board b = new Board();
		String id = (String)request.getSession().getAttribute("login");
		try {
			int maxnum = bdao.maxnum();
			b.setBoardnum(++maxnum);
			b.setBoardtype(0);
			b.setBoardcategory(0);
			b.setId(id);
			b.setTitle(request.getParameter("title"));
			b.setContent(request.getParameter("content"));
			if(bdao.insert(b)){
				msg ="공지글 등록 성공";
				url ="../board/list.do";
			}
		}catch(Exception e) {
			throw new ServletException(e);
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward noticeinfo
	(HttpServletRequest request,HttpServletResponse response) {
		BoardDao bdao = new BoardDao();
		String login = (String) request.getSession().getAttribute("login");
		int boardtype = Integer.parseInt(request.getParameter("boardtype"));
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		int boardcategory = Integer.parseInt(request.getParameter("boardcategory"));
		Board b = bdao.selectOne(boardnum,boardtype,boardcategory);
		String nick = new MemberDao().selectOne(b.getId()).getNick();
		int memnum = new MemberDao().selectOne(login).getMemnum();
		if(request.getRequestURI().contains("info.do")) {
			bdao.readcntadd(boardnum);
		}
		request.setAttribute("b", b);
		request.setAttribute("nick", nick);
		request.setAttribute("memnum", memnum);
		return new ActionForward();
	}
	public ActionForward noticeupdate
	(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String path = request.getServletContext().getRealPath("/")+"model2/board/file/";
		MultipartRequest multi = new MultipartRequest
				(request,path,10*1024*1024,"utf-8");
		Board b = new Board();
		BoardDao bdao = new BoardDao();
		b.setBoardnum(Integer.parseInt(multi.getParameter("boardnum")));
		b.setBoardtype(Integer.parseInt(multi.getParameter("boardtype")));
		b.setBoardcategory(Integer.parseInt(multi.getParameter("boardcategory")));
		System.out.println(multi.getParameter("id"));
		b.setId(multi.getParameter("id"));
		b.setTitle(multi.getParameter("title"));
		b.setContent(multi.getParameter("content"));
		String msg="글 수정에 실패하였습니다.";
		String url="updateForm.do?boardtype="+b.getBoardtype()+"&boardnum="+b.getBoardnum()+"&boardcategory="+b.getBoardcategory();
		
		if(bdao.update(b)){
			msg="글 수정에 성공하였습니다.";
			url = "info.do?boardtype="+b.getBoardtype()+"&boardnum="+b.getBoardnum()+"&boardcategory="+b.getBoardcategory();
		}
		request.setAttribute("msg",msg);
		request.setAttribute("url",url);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward noticedelete
	(HttpServletRequest request,HttpServletResponse response) throws Exception {
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		int boardtype = Integer.parseInt(request.getParameter("boardtype"));
		int boardcategory = Integer.parseInt(request.getParameter("boardcategory"));

		BoardDao bdao = new BoardDao();
		String msg=null;
		String url=null;
		Board b = bdao.selectOne(boardnum,boardtype,boardcategory);
		if(b==null){
			msg="이미 삭제된 글 입니다.";
			url="../board/list.do";
		}else{
			if(bdao.delete(boardnum)){
				msg="글 삭제에 성공하였습니다";
				url="../board/list.do";
			}else{
				msg="글 삭제에 실패하였습니다.";
				url="info.do?boardtype="+boardtype+"&boardnum="+boardnum+"&boardcategory="+boardcategory;
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward imgfiledown
	(HttpServletRequest request,HttpServletResponse response) throws Exception {
		   request.setCharacterEncoding("euc-kr");
		   String filePath = request.getParameter("filename");
		   int pos = filePath.lastIndexOf("\\");
		   if (pos == -1)
		 	  pos = filePath.lastIndexOf("/");
		   String fileName = filePath.substring(pos+1); 
		   
		 //  String filepath = request.getParameter("filepath");
		   //한글 인코딩 방식 (iso-8859-1) = euc-kr
		   byte b[] = new byte[4096];
		   System.out.println("d:/setup/file/" + filePath);
		   System.out.println("/projectone/model2/imageboard/file/" + filePath);
		   FileInputStream in = new FileInputStream
				   ("C:/Users/alice/htmllanguge/html/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps"
				  + "/projectone/model2/imageboard/file/"+filePath);
		   //다운로드할 파일의 MIME type을 설정
		   response.setContentType("application/octet-stream");
		   response.setHeader("Content-Disposition",
		 		    "attachment; filename=" + fileName);
		   
		   ServletOutputStream out2 = response.getOutputStream();
		   int numRead;
		   while((numRead = in.read(b,0,b.length)) != -1) {
		 	  out2.write(b,0,numRead);
		   }
		   out2.flush();
		   out2.close();
		   in.close();
		return new ActionForward();
	}
	public ActionForward qawrite
	(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String msg="가입 절차 QA 등록 실패";
		String url="writeForm.do";
		QAlistDao qadao = new QAlistDao();
		QAlist qa = new QAlist();
		try {
			int maxnum = qadao.maxnum();
			qa.setQanum(++maxnum);
			qa.setQuestion(request.getParameter("question"));
			qa.setAnswer(request.getParameter("answer"));
			if(qadao.insert(qa)){
				msg ="가입 절차 QA 등록 성공";
				url ="list.do";
			}
		}catch(Exception e) {
			throw new ServletException(e);
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward qainfo
	(HttpServletRequest request,HttpServletResponse response) {
		int qanum = Integer.parseInt(request.getParameter("qanum"));
		QAlist qa = new QAlistDao().selectOne(qanum);
		request.setAttribute("qa", qa);
		return new ActionForward();
	}
	public ActionForward qaupdate
	(HttpServletRequest request,HttpServletResponse response) {
		QAlistDao qadao = new QAlistDao();
		QAlist qa = new QAlist();
		qa.setQanum(Integer.parseInt(request.getParameter("qanum")));
		qa.setQuestion(request.getParameter("question"));
		qa.setAnswer(request.getParameter("answer"));
		String msg="글 수정에 실패하였습니다.";
		String url="updateForm.do?qanum="+qa.getQanum();
		
		if(qadao.update(qa)){
			msg="글 수정에 성공하였습니다.";
			url = "list.do";
		request.setAttribute("msg",msg);
		request.setAttribute("url",url);
		}
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward qalist
	(HttpServletRequest request,HttpServletResponse response) {
		QAlistDao qadao = new QAlistDao();
		int limit = 10;
		int pageNum= 1;
		try{
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}catch(NumberFormatException e){}
		
		int qacount = qadao.qacount();
		List<QAlist> list = qadao.qalist(pageNum,limit);
		
		int maxpage = (int)((double)qacount/limit+0.95);
		int startpage = ((int)(pageNum/10.0+0.9)-1)*10+1;
		int endpage = startpage+9;
		
		if (endpage>maxpage) endpage=maxpage; 
		int qanum = qacount - (pageNum -1)*limit;
		
		request.setAttribute("qacount", qacount);
		request.setAttribute("list", list);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("qanum", qanum);
		request.setAttribute("pageNum", pageNum);
		return new ActionForward();
	}
	public ActionForward commentwrite
	(HttpServletRequest request,HttpServletResponse response) throws Exception {
		int boardtype = Integer.parseInt(request.getParameter("boardtype"));
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		int boardcategory = Integer.parseInt(request.getParameter("boardcategory"));
		String id = request.getParameter("id");
		int memnum = new MemberDao().select_memnum_id(id);
		String url="info.do?boardtype="+boardtype+"&boardnum="+boardnum+"&boardcategory="+boardcategory;
		Comment c = new Comment();
		CommentDao cdao = new CommentDao();
		try {
			int maxnum = cdao.maxnum();
			c.setCommentnum(++maxnum); 
			c.setBoardnum(boardnum);
			c.setMemnum(memnum);
			c.setContent(request.getParameter("content"));
			if(cdao.insert(c)){
				url="commentlist.do?boardtype="+boardtype+"&boardnum="+boardnum+"&boardcategory="+boardcategory;
			}
		}catch(Exception e) {
			throw new ServletException(e);
		}
		request.setAttribute("url", url);
		return new ActionForward(false,"../../url.jsp");
	}
	public ActionForward commentlist
	(HttpServletRequest request,HttpServletResponse response) {
		CommentDao cdao = new CommentDao();
		int boardtype = Integer.parseInt(request.getParameter("boardtype"));
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		int boardcategory = Integer.parseInt(request.getParameter("boardcategory"));
		int ccount = cdao.commentcount(boardnum);
		List<Comment> list = cdao.commentlist_select(boardnum);
		int size= list.size();
		
		List<String> nicklist = new ArrayList<String>();
		for (int i = 0; i <size; i++) {	
			nicklist.add(new MemberDao().select_nick(list.get(i).getMemnum()));
		}
		List<String> idlist = new ArrayList<String>();
		for (int i = 0; i <size; i++) {	
			idlist.add(new MemberDao().select_id(list.get(i).getMemnum()));
		}

		request.setAttribute("ccount", ccount);
		request.setAttribute("list", list);
		request.setAttribute("nicklist", nicklist);
		request.setAttribute("boardtype", boardtype);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("boardcategory", boardcategory);
		request.setAttribute("idlist", idlist);
		return new ActionForward(false,"info.do?boardtype="+boardtype+"&boardnum="+boardnum+"&boardcategory="+boardcategory);
	}
	public ActionForward commentdelete
	(HttpServletRequest request,HttpServletResponse response) {
		CommentDao cdao = new CommentDao();
		int commentnum = Integer.parseInt(request.getParameter("commentnum"));
		String reffer = (String)request.getHeader("REFERER");
		String msg=null;
		String url=reffer;
		Comment c = cdao.selectOne(commentnum);
		if(c==null){
			msg="이미 삭제된 댓글 입니다.";
		}else{
			if(cdao.delete(commentnum)){
				msg="댓글 삭제에 성공하였습니다";
			}else{
				msg="댓글삭제에 실패하였습니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward mylist_select
	(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String msg="리스트에 저장실패";
		String reffer = (String)request.getHeader("REFERER");
		String id = request.getParameter("id");
		int listnum = Integer.parseInt(request.getParameter("listnum"));
		int memnum = new MemberDao().select_memnum_id(id);
		String url=reffer;
		MyList ml = new MyList();
		MyListDao mldao = new MyListDao();
		try {
			int maxnum = mldao.maxnum();
			ml.setMylistnum(++maxnum); 
			ml.setMemnum(memnum);
			ml.setListnum(listnum);
			if(mldao.insert(ml)){
				msg ="리스트에 저장성공";
				url=reffer;
			}
		}catch(Exception e) {
			throw new ServletException(e);
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../../alert.jsp");
	}
	public ActionForward mylist_delete
	(HttpServletRequest request,HttpServletResponse response) {
		MyListDao mldao = new MyListDao();
		String id = request.getParameter("id");
		int listnum = Integer.parseInt(request.getParameter("listnum"));
		String reffer = (String)request.getHeader("REFERER");
		String msg=null;
		String url=reffer;
		int memnum = new MemberDao().select_memnum_id(id);
		System.out.println(memnum);
		MyList c = mldao.selectOne(listnum,memnum);
		if(c==null){
			msg="이미 삭제된 댓글 입니다.";
		}else{
			if(mldao.delete(listnum,memnum)){
				msg="댓글 삭제에 성공하였습니다";
			}else{
				msg="댓글삭제에 실패하였습니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../../alert.jsp");
	}
}
