package com.fianl.AMANDA.match.model.vo;

public class Match{
	private int likeNo;
	private int u_mid;
	private String likeSender;
	private String likeReceiver;
	private String likeStatus;
	private int likeSusin;
	
	public Match() {
		super();
	}
	public Match(int likeNo, int u_mid, String likeSender, String likeReceiver, String likeStatus, int likeSusin) {
		super();
		this.likeNo = likeNo;
		this.u_mid = u_mid;
		this.likeSender = likeSender;
		this.likeReceiver = likeReceiver;
		this.likeStatus = likeStatus;
		this.likeSusin = likeSusin;
	}
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public int getU_mid() {
		return u_mid;
	}
	public void setU_mid(int u_mid) {
		this.u_mid = u_mid;
	}
	public String getLikeSender() {
		return likeSender;
	}
	public void setLikeSender(String likeSender) {
		this.likeSender = likeSender;
	}
	public String getLikeReceiver() {
		return likeReceiver;
	}
	public void setLikeReceiver(String likeReceiver) {
		this.likeReceiver = likeReceiver;
	}
	public String getLikeStatus() {
		return likeStatus;
	}
	public void setLikeStatus(String likeStatus) {
		this.likeStatus = likeStatus;
	}
	public int getLikeSusin() {
		return likeSusin;
	}
	public void setLikeSusin(int likeSusin) {
		this.likeSusin = likeSusin;
	}
	
	@Override
	public String toString() {
		return "Match [likeNo=" + likeNo + ", u_mid=" + u_mid + ", likeSender=" + likeSender + ", likeReceiver="
				+ likeReceiver + ", likeStatus=" + likeStatus + ", likeSusin=" + likeSusin + "]";
	}
	
}
 