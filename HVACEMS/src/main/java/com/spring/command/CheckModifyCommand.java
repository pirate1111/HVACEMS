package com.spring.command;

import com.spring.dto.CheckVO;

public class CheckModifyCommand extends CheckRegistCommand {

   private int checkNum;
   private int[] deleteFile;
   
   public int getCheckNum() {
      return checkNum;
   }
   public void setCheckNum(int pno) {
      this.checkNum = pno;
   }
   public int[] getDeleteFile() {
      return deleteFile;
   }
   public void setDeleteFile(int[] deleteFile) {
      this.deleteFile = deleteFile;
   }
   
   @Override
   public CheckVO toCheckVO() {
	   CheckVO check = super.toCheckVO();
	   check.setCheckNum(this.checkNum);
	   return check;
   }
}