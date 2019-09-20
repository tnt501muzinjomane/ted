class SwaziVisitorInfosController < ApplicationController
  before_action :set_swazi_visitor_info, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index

    @user = User.where(:id =>  params[:search])
    @users = User.all

     if params[:search] == ''

      $yy = VisitorInfo.where('citizenship = ?  AND date_of_arrival BETWEEN ? AND ?', 'Swazi', params[:start_date], params[:end_date]).sum(:male)
    $zz = VisitorInfo.where('citizenship = ?  AND date_of_arrival BETWEEN ? AND ?', 'Swazi', params[:start_date], params[:end_date]).sum(:female)

    


    @chart15 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Gender")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Male visitors", :yAxis => 0, :data => [$yy])
          f.series(:name => "Female visitors", :yAxis => 0, :data => [$zz])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end

        
        $a11 = VisitorInfo.where('citizenship = ?  AND date_of_arrival BETWEEN ? AND ?', 'Swazi', params[:start_date], params[:end_date]).sum(:Below_18)
        $a22 = VisitorInfo.where('citizenship = ?  AND date_of_arrival BETWEEN ? AND ?', 'Swazi', params[:start_date], params[:end_date]).sum(:age18_24)
        $a33 = VisitorInfo.where('citizenship = ?  AND date_of_arrival BETWEEN ? AND ?', 'Swazi', params[:start_date], params[:end_date]).sum(:age25_34)
        $a44 = VisitorInfo.where('citizenship = ? AND date_of_arrival BETWEEN ? AND ?', 'Swazi', params[:start_date], params[:end_date]).sum(:age35_44)
        $a55 = VisitorInfo.where('citizenship = ?  AND date_of_arrival BETWEEN ? AND ?', 'Swazi', params[:start_date], params[:end_date]).sum(:age45_54)
        $a66 = VisitorInfo.where('citizenship = ? AND date_of_arrival BETWEEN ? AND ?', 'Swazi', params[:start_date], params[:end_date]).sum(:age55_64)
        $a77 = VisitorInfo.where('citizenship = ? AND date_of_arrival BETWEEN ? AND ?', 'Swazi', params[:start_date], params[:end_date]).sum(:age65)


        @chart16 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Age group")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Below 18", :yAxis => 0, :data => [$a11])
          f.series(:name => "18-24", :yAxis => 0, :data => [$a22])
          f.series(:name => "25-34", :yAxis => 0, :data => [$a33])
          f.series(:name => "35-44", :yAxis => 0, :data => [$a44])
          f.series(:name => "45-54", :yAxis => 0, :data => [$a55])
          f.series(:name => "55-64", :yAxis => 0, :data => [$a66])
          f.series(:name => "65 + above", :yAxis => 0, :data => [$a77])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end


        
         $edu = Reason.where('citizen = ? AND reason = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "Educational", params[:start_date], params[:end_date]).sum(:nump)

         $recre = Reason.where('citizen = ? AND reason = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "Recreation/leisure", params[:start_date], params[:end_date]).sum(:nump)


         $rese = Reason.where('citizen = ? AND reason = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "Research", params[:start_date], params[:end_date]).sum(:nump)
         
         $other = Reason.where('citizen = ? AND reason = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "Other", params[:start_date], params[:end_date]).sum(:nump)

        
           @chart17 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Reasons for visit")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Educational", :yAxis => 0, :data => [$edu])
          f.series(:name => "Recreation/leisure", :yAxis => 0, :data => [$recre])
          f.series(:name => "Research", :yAxis => 0, :data => [$rese])
          f.series(:name => "Other", :yAxis => 0, :data => [$other])
          
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end



         

          $mode = Transport.where('citizen = ? AND trans = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "Personal car", params[:start_date], params[:end_date]).sum(:nump)


          $mode1 = Transport.where('citizen = ? AND trans = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "Rental car", params[:start_date], params[:end_date]).sum(:nump)


          $mode2 = Transport.where('citizen = ? AND trans = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "Tour bus", params[:start_date], params[:end_date]).sum(:nump)


          $mode3 = Transport.where('citizen = ? AND trans = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "School bus", params[:start_date], params[:end_date]).sum(:nump)


          $mode4 = Transport.where('citizen = ? AND trans = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "Motor bike", params[:start_date], params[:end_date]).sum(:nump)



          $mode5 = Transport.where('citizen = ? AND trans = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "Other", params[:start_date], params[:end_date]).sum(:nump)

          @chart18 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Mode of transport")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Personal car", :yAxis => 0, :data => [$mode])
          f.series(:name => "Rental car", :yAxis => 0, :data => [$mode1])
          f.series(:name => "Tour bus", :yAxis => 0, :data => [$mode2])
          f.series(:name => "School bus", :yAxis => 0, :data => [$mode3])
          f.series(:name => "Motor bike", :yAxis => 0, :data => [$mode4])
          f.series(:name => "Other", :yAxis => 0, :data => [$mode5])
          
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end


          $part1 = Partnership.where('citizen = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "Alone", params[:start_date], params[:end_date]).sum(:nump)
          
          


          $part2 = Partnership.where('citizen = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "With colleagues", params[:start_date], params[:end_date]).sum(:nump)
         

          $part3 = Partnership.where('citizen = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "With friends & relatives", params[:start_date], params[:end_date]).sum(:nump)
          


           $part4 = Partnership.where('citizen = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "With spouse/partner", params[:start_date], params[:end_date]).sum(:nump)
           

         

          $part5 = Partnership.where('citizen = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "With family", params[:start_date], params[:end_date]).sum(:nump)
          

         


          $part6 = Partnership.where('citizen = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "With children", params[:start_date], params[:end_date]).sum(:nump)
          

         

          $part7 = Partnership.where('citizen = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "Packaged tour", params[:start_date], params[:end_date]).sum(:nump)
          
          
         


          $part8 = Partnership.where('citizen = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "School tour", params[:start_date], params[:end_date]).sum(:nump)
          

       

          $part9 = Partnership.where('citizen = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', 'Swazi', "Other", params[:start_date], params[:end_date]).sum(:nump)
          

          @chart19 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Travel partnership")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Individual", :yAxis => 0, :data => [$part1])
          f.series(:name => "With colleagues", :yAxis => 0, :data => [$part2])
          f.series(:name => "With friends & relatives", :yAxis => 0, :data => [$part3])
          f.series(:name => "With spouse/partner", :yAxis => 0, :data => [$part4])
          f.series(:name => "With family", :yAxis => 0, :data => [$part5])
          f.series(:name => "With children", :yAxis => 0, :data => [$part6])

          f.series(:name => "Packaged tour", :yAxis => 0, :data => [$part7])
          f.series(:name => "School tour", :yAxis => 0, :data => [$part8])
          f.series(:name => "Other", :yAxis => 0, :data => [$part9])
          
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end

         
    @swazi_visitor_infos = SwaziVisitorInfo.paginate(:page => params[:page], :per_page => 20).order("id DESC")
    respond_with(@swazi_visitor_infos)



     else

    $yy = VisitorInfo.where('citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Swazi', params[:search], params[:start_date], params[:end_date]).sum(:male)
    $zz = VisitorInfo.where('citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Swazi', params[:search], params[:start_date], params[:end_date]).sum(:female)

    


    @chart15 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Gender")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Male visitors", :yAxis => 0, :data => [$yy])
          f.series(:name => "Female visitors", :yAxis => 0, :data => [$zz])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end

        
        $a11 = VisitorInfo.where('citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Swazi', params[:search], params[:start_date], params[:end_date]).sum(:Below_18)
        $a22 = VisitorInfo.where('citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Swazi', params[:search], params[:start_date], params[:end_date]).sum(:age18_24)
        $a33 = VisitorInfo.where('citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Swazi', params[:search], params[:start_date], params[:end_date]).sum(:age25_34)
        $a44 = VisitorInfo.where('citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Swazi', params[:search], params[:start_date], params[:end_date]).sum(:age35_44)
        $a55 = VisitorInfo.where('citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Swazi', params[:search], params[:start_date], params[:end_date]).sum(:age45_54)
        $a66 = VisitorInfo.where('citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Swazi', params[:search], params[:start_date], params[:end_date]).sum(:age55_64)
        $a77 = VisitorInfo.where('citizenship = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Swazi', params[:search], params[:start_date], params[:end_date]).sum(:age65)


        @chart16 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Age group")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Below 18", :yAxis => 0, :data => [$a11])
          f.series(:name => "18-24", :yAxis => 0, :data => [$a22])
          f.series(:name => "25-34", :yAxis => 0, :data => [$a33])
          f.series(:name => "35-44", :yAxis => 0, :data => [$a44])
          f.series(:name => "45-54", :yAxis => 0, :data => [$a55])
          f.series(:name => "55-64", :yAxis => 0, :data => [$a66])
          f.series(:name => "65 + above", :yAxis => 0, :data => [$a77])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end


        
         $edu = Reason.where('citizen = ? AND user_id = ? AND reason = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "Educational", params[:start_date], params[:end_date]).sum(:nump)

         $recre = Reason.where('citizen = ? AND user_id = ? AND reason = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "Recreation/leisure", params[:start_date], params[:end_date]).sum(:nump)


         $rese = Reason.where('citizen = ? AND user_id = ? AND reason = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "Research", params[:start_date], params[:end_date]).sum(:nump)
         
         $other = Reason.where('citizen = ? AND user_id = ? AND reason = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "Other", params[:start_date], params[:end_date]).sum(:nump)

        
           @chart17 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Reasons for visit")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Educational", :yAxis => 0, :data => [$edu])
          f.series(:name => "Recreation/leisure", :yAxis => 0, :data => [$recre])
          f.series(:name => "Research", :yAxis => 0, :data => [$rese])
          f.series(:name => "Other", :yAxis => 0, :data => [$other])
          
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end




          $mode = Transport.where('citizen = ? AND user_id = ? AND trans = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "Personal car", params[:start_date], params[:end_date]).sum(:nump)

         
          $mode1 = Transport.where('citizen = ? AND user_id = ? AND trans = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "Rental car", params[:start_date], params[:end_date]).sum(:nump)


        
          $mode2 = Transport.where('citizen = ? AND user_id = ? AND trans = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "Tour bus", params[:start_date], params[:end_date]).sum(:nump)


          $mode3 = Transport.where('citizen = ? AND user_id = ? AND trans = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "School bus", params[:start_date], params[:end_date]).sum(:nump)


          $mode4 = Transport.where('citizen = ? AND user_id = ? AND trans = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "Motor bike", params[:start_date], params[:end_date]).sum(:nump)


          $mode5 = Transport.where('citizen = ? AND user_id = ? AND trans = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "Other", params[:start_date], params[:end_date]).sum(:nump)

          @chart18 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Mode of transport")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Personal car", :yAxis => 0, :data => [$mode])
          f.series(:name => "Rental car", :yAxis => 0, :data => [$mode1])
          f.series(:name => "Tour bus", :yAxis => 0, :data => [$mode2])
          f.series(:name => "School bus", :yAxis => 0, :data => [$mode3])
          f.series(:name => "Motor bike", :yAxis => 0, :data => [$mode4])
          f.series(:name => "Other", :yAxis => 0, :data => [$mode5])
          
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end


          $part1 = Partnership.where('citizen = ? AND user_id = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "Alone", params[:start_date], params[:end_date]).sum(:nump)
          

          


          $part2 = Partnership.where('citizen = ? AND user_id = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "With colleagues", params[:start_date], params[:end_date]).sum(:nump)
          

         

          $part3 = Partnership.where('citizen = ? AND user_id = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "With friends & relatives", params[:start_date], params[:end_date]).sum(:nump)
          

         

           $part4 = Partnership.where('citizen = ? AND user_id = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "With spouse/partner", params[:start_date], params[:end_date]).sum(:nump)
          

          

          $part5 = Partnership.where('citizen = ? AND user_id = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "With family", params[:start_date], params[:end_date]).sum(:nump)
          

          


          $part6 = Partnership.where('citizen = ? AND user_id = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "With children", params[:start_date], params[:end_date]).sum(:nump)
          

          

          $part7 = Partnership.where('citizen = ? AND user_id = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "Packaged tour", params[:start_date], params[:end_date]).sum(:nump)
         
          
          


          $part8 = Partnership.where('citizen = ? AND user_id = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "School tour", params[:start_date], params[:end_date]).sum(:nump)
          
          

          $part9 = Partnership.where('citizen = ? AND user_id = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', 'Swazi', params[:search], "Other", params[:start_date], params[:end_date]).sum(:nump)
          

          
          

          @chart19 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Travel partnership")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Individual", :yAxis => 0, :data => [$part1])
          f.series(:name => "With colleagues", :yAxis => 0, :data => [$part2])
          f.series(:name => "With friends & relatives", :yAxis => 0, :data => [$part3])
          f.series(:name => "With spouse/partner", :yAxis => 0, :data => [$part4])
          f.series(:name => "With family", :yAxis => 0, :data => [$part5])
          f.series(:name => "With children", :yAxis => 0, :data => [$part6])

          f.series(:name => "Packaged tour", :yAxis => 0, :data => [$part7])
          f.series(:name => "School tour", :yAxis => 0, :data => [$part8])
          f.series(:name => "Other", :yAxis => 0, :data => [$part9])
          
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end

          
         @g = Reason.all
    respond_to do |format|
      format.html
      format.csv { send_data @g.to_csv, filename: "reasons-#{Date.today}.csv"}
      
    end
    end
  end

  def show
    respond_with(@swazi_visitor_info)
  end

  def new
    @swazi_visitor_info = SwaziVisitorInfo.new
    respond_with(@swazi_visitor_info)
  end

  def edit
  end

  def create
    @swazi_visitor_info = SwaziVisitorInfo.new(swazi_visitor_info_params)
    @swazi_visitor_info.save
    respond_with(@swazi_visitor_info)
  end

  def update
    @swazi_visitor_info.update(swazi_visitor_info_params)
    respond_with(@swazi_visitor_info)
  end

  def destroy
    @swazi_visitor_info.destroy
    respond_with(@swazi_visitor_info)
  end

  private
    def set_swazi_visitor_info
      @swazi_visitor_info = SwaziVisitorInfo.find(params[:id])
    end

    def swazi_visitor_info_params
      params.require(:swazi_visitor_info).permit(:place_of_residence, :visitor_info_id)
    end
end
