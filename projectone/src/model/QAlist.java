package model;

public class QAlist {
	private int qanum;
	private String question;
	private String answer;
	public int getQanum() {
		return qanum;
	}
	public void setQanum(int qanum) {
		this.qanum = qanum;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "QAlist [qanum=" + qanum + ", question=" + question + ", answer=" + answer + "]";
	}
	
	
}
