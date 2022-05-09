<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%if (pageNumber>1) {%>

                   <div class="">
                   
				    <div class="container">
	                    <div class="droppage">
	    	                <div class="select">
                            第 <%=whichPage%> 頁
                            <i class="fa fa-chevron-left"></i>
                          	</div>
                             <input type="hidden" name="special_care">
	      		            
	      		            <ul class="droppage-menu">
								
							           <%for (int i=1; i<=pageNumber; i++){%>
						            	<%if(i != whichPage) {%>
						            <li 
						            	onclick="location.href='<%=request.getRequestURI()%>?whichPage=<%=i%>'"
						            	value="<%=i%>">第<%=i%>頁
						            </li>
						            	<%}%> 
						       		<%}%> 
	                      	</ul>
	                     </div>    
                     <div>
                   </div>
                     
	                <!-- <div class="animalSearchSelect-customSelect-btn">
	                    <div class="split m-split_fullHeight">
	                    	這裡是1/4頁
	                    </div>
	                </div> -->
	            </div>
	        </div>

  <%}%>

  <%if (rowsPerPage<rowNumber) {%>
    <%if(pageIndex>=rowsPerPage){%>
        
        <div class="grid-col grid-col_1/3 u-isHidden@maxMd">
		<button 
			class="fieldBtn fieldBtn_altHover m-fieldBtn_tight m-fieldBtn_full"
			onclick="location.href='<%=request.getRequestURI()%>?whichPage=<%=whichPage-1%>'"
			type="button">
	        <span class="fieldBtn-icon">
	            <span class="icon icon_sm m-icon_colorPrimary">
	                <svg role="img">
	                    <use xlink:href="#icon-chevronLeft"></use>
	                </svg>
	            </span>
	        </span>
	        <span class="fieldBtn-label">上一頁</span>
	    </button>
	</div>&nbsp;
    <%}%>
    
<!--分頁標籤分頁標籤分頁標籤分頁標籤分頁標籤分頁標籤分頁標籤分頁標籤分頁標籤-->
  
    <%if(pageIndex<pageIndexArray[pageNumber-1]){%>
        <div class="grid-col grid-col_1/3 u-isHidden@maxMd">
    <button
        class="fieldBtn fieldBtn_altHover m-fieldBtn_iconRt m-fieldBtn_tight m-fieldBtn_full"
        onclick="location.href='<%=request.getRequestURI()%>?whichPage=<%=whichPage+1%>'"	
        type="button">
        <span class="fieldBtn-label">下一頁</span>
        <span class="fieldBtn-icon">
            <span
                class="icon icon_sm m-icon_colorPrimary">
                <svg role="img">
                    <use
                        xlink:href="#icon-chevronRight">
                    </use>
                </svg>
            </span>
        </span>
    </button>
</div>
        
    <%}%>
  <%}%>  

<br><br>





<br><br>

  <%--if (pageNumber>1) {%>
    <FORM METHOD="post" ACTION="<%=request.getRequestURI()%>">   
       <select size="1" name="whichPage">
         <%for (int i=1; i<=pageNumber; i++){%>
            <option value="<%=i%>">跳至第<%=i%>頁
         <%}%> 
       </select>
       <input type="submit" value="確定" >  
    </FORM>
  <%}--%>