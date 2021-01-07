package test.file.dao;

public class FileDao {
	//static 필드
	private static FileDao dao;
	//외부에서 객체생성 하지 못하도록 생성자를 private
	private FileDao() {}
	//자신의 참조값을 리턴해주는 메소드
	public static FileDao getInstance() {
		if(dao==null) {
			dao=new FileDao();
		}
		return dao;
	}
}
