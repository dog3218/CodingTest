package app_member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


import app_member.MemberPage;




@Repository
public class MemberDAO_GW{
	
		@Autowired @Qualifier("c##cnb") SqlSession sql;
		
		
		//회원전체 정보 가져오기
		public MemberPage member_list(MemberPage page){
			System.out.println("keyword: "+ page.getKeyword()+" , search : "+page.getSearch());
			if(page.getKeyword() != null) {
				if(page.getKeyword().trim().length()==0) {
					page.setTotalList(sql.selectOne("totalList", page));	
					page.setList(sql.selectList("member.mapper.list", page));	
						return page;
				}
				//검색한 회원목록 조회
				page.setTotalList(sql.selectOne("member.mapper.totalList_search", page)) ;
				if(page.getTotalList()==0) {
					return page;
				}else {
					page.setTotalList(page.getTotalList());
				}
			
			//페이징 처리된 전체 회원목록 조회
			page.setList(sql.selectList("member.mapper.list_search", page));
			return page;
			}else {//그냥 싹다 갖고 오기
			page.setTotalList(sql.selectOne("totalList", page));	
			page.setList(sql.selectList("member.mapper.list", page));	
				return page;
			}
			
		}
		//회원 한명의 정보 가져오기
		public MemberVO member_select(int id) {
			MemberVO vo = sql.selectOne("member.mapper.select_one", id);
			
			
			return vo;
		}
		
		public int member_delete(int id) {
			
			return sql.delete("member.mapper.member_delete", id);
		}
		
		public int member_modify(MemberVO vo) {
			return sql.insert("member.mapper.member_modify", vo);
		}
		
		public int member_regist(MemberVO vo) {
			return sql.insert("member.mapper.member_regist", vo);
		}
		public boolean member_idnum_check(String idnum) {
			
			return (Integer) sql.selectOne("member.mapper.idnum_check",idnum) == 0 ? true : false;
		}
		
		

}












