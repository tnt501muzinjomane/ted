class EstablishmentDashboardsController < ApplicationController

def index

   @user = User.where(:id =>  params[:search])
   @users = User.all


    
     if params[:search]
      
       @v = VisitorInfo.where({user_id: params[:search]})
    
     end


     if params[:search] == ''


        $mos = Transport.where('trans = ?  AND rdate BETWEEN ? AND ?', 'Personal car', params[:start_date], params[:end_date]).sum(:nump)


       $mos1 = Transport.where('trans = ?  AND rdate BETWEEN ? AND ?', 'Rental car', params[:start_date], params[:end_date]).sum(:nump)


       $mos2 = Transport.where('trans = ?  AND rdate BETWEEN ? AND ?', 'Tour bus', params[:start_date], params[:end_date]).sum(:nump)


       $mos3 = Transport.where('trans = ?  AND rdate BETWEEN ? AND ?', 'School bus', params[:start_date], params[:end_date]).sum(:nump)



       $mos4 = Transport.where('trans = ?  AND rdate BETWEEN ? AND ?', 'Motor bike', params[:start_date], params[:end_date]).sum(:nump)


       $mos5 = Transport.where('trans = ?  AND rdate BETWEEN ? AND ?', 'Other', params[:start_date], params[:end_date]).sum(:nump)


        @chart64 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Mode of transport")
	  f.xAxis(:categories => ["Number of visitors"])
	  f.series(:name => "Personal car", :yAxis => 0, :data => [$mos])
	  f.series(:name => "Rental car", :yAxis => 0, :data => [$mos1])
          f.series(:name => "Tour bus", :yAxis => 0, :data => [$mos2])
          f.series(:name => "School bus", :yAxis => 0, :data => [$mos3])



          f.series(:name => "Motor bike", :yAxis => 0, :data => [$mos4])
          f.series(:name => "Other", :yAxis => 0, :data => [$mos5])
          


	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} }
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end



       $pars = Partnership.where('partnership = ?  AND rdate BETWEEN ? AND ?', 'Alone', params[:start_date], params[:end_date]).sum(:nump)
      

       

        $pars1 = Partnership.where('partnership = ?  AND rdate BETWEEN ? AND ?', 'With spouse/partner', params[:start_date], params[:end_date]).sum(:nump)
        



        $pars2 = Partnership.where('partnership = ?  AND rdate BETWEEN ? AND ?', 'With colleagues', params[:start_date], params[:end_date]).sum(:nump)
       

       

        $pars3 = Partnership.where('partnership = ?  AND rdate BETWEEN ? AND ?', 'With friends & relatives', params[:start_date], params[:end_date]).sum(:nump)
               

        
        $pars4 = Partnership.where('partnership = ?  AND rdate BETWEEN ? AND ?', 'With family', params[:start_date], params[:end_date]).sum(:nump)
                

       

        $pars5 = Partnership.where('partnership = ?  AND rdate BETWEEN ? AND ?', 'With children', params[:start_date], params[:end_date]).sum(:nump)
       


        $pars6 = Partnership.where('partnership = ?  AND rdate BETWEEN ? AND ?', 'Packaged tour', params[:start_date], params[:end_date]).sum(:nump)
       


        


        $pars7 = Partnership.where('partnership = ?  AND rdate BETWEEN ? AND ?', 'School tour', params[:start_date], params[:end_date]).sum(:nump)
        
        

        
        $pars8 = Partnership.where('partnership = ?  AND rdate BETWEEN ? AND ?', 'Other', params[:start_date], params[:end_date]).sum(:nump)
        

        
      
      
         @chart63 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Travel partnership")
	  f.xAxis(:categories => ["Number of visitors"])
	  f.series(:name => "Alone", :yAxis => 0, :data => [$pars])
	  f.series(:name => "With spouse/partner", :yAxis => 0, :data => [$pars1])
          f.series(:name => "With colleagues", :yAxis => 0, :data => [$pars2])
          f.series(:name => "With friends & relatives", :yAxis => 0, :data => [$pars3])



          f.series(:name => "With family", :yAxis => 0, :data => [$pars4])
          f.series(:name => "With children", :yAxis => 0, :data => [$pars5])
          f.series(:name => "Packaged tour", :yAxis => 0, :data => [$pars6])
          f.series(:name => "School tour", :yAxis => 0, :data => [$pars7])
          f.series(:name => "Other", :yAxis => 0, :data => [$pars8])


	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} }
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end


        $reas = Reason.where('reason = ?  AND rdate BETWEEN ? AND ?', 'Recreation/leisure', params[:start_date], params[:end_date]).sum(:nump)

        $reas2 = Reason.where('reason = ?  AND rdate BETWEEN ? AND ?', 'Educational', params[:start_date], params[:end_date]).sum(:nump)

        $reas4 = Reason.where('reason = ?  AND rdate BETWEEN ? AND ?', 'Research', params[:start_date], params[:end_date]).sum(:nump)

        $reas6 = Reason.where('reason = ?  AND rdate BETWEEN ? AND ?', 'Other', params[:start_date], params[:end_date]).sum(:nump)

      

        @chart62 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Reasons for visit")
	  f.xAxis(:categories => ["Number of visitors"])
	  f.series(:name => "Recreation/leisure", :yAxis => 0, :data => [$reas])
	  f.series(:name => "Educational", :yAxis => 0, :data => [$reas2])
          f.series(:name => "Research", :yAxis => 0, :data => [$reas4])
          f.series(:name => "Other", :yAxis => 0, :data => [$reas6])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} }
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end
   
  

       @d = VisitorInfo.where('travel = ?  AND date_of_arrival BETWEEN ? AND ?', 'individual', params[:start_date], params[:end_date]).sum(:male)

      @d1 = VisitorInfo.where('travel = ?  AND date_of_arrival BETWEEN ? AND ?', 'individual', params[:start_date], params[:end_date]).sum(:female)

     $j = @d + @d1


     @d2 = VisitorInfo.where('travel = ?  AND date_of_arrival BETWEEN ? AND ?', 'group', params[:start_date], params[:end_date]).sum(:female)

     @d12 = VisitorInfo.where('travel = ?  AND date_of_arrival BETWEEN ? AND ?', 'group', params[:start_date], params[:end_date]).sum(:male)

     $k =  @d2 + @d12

  
       



        @chart7 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Type of visitors")
	  f.xAxis(:categories => ["Number of visitors"])
	  f.series(:name => "Individual", :yAxis => 0, :data => [$j])
	  f.series(:name => "Group", :yAxis => 0, :data => [$k])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} }
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end

        


    $male = VisitorInfo.where('date_of_arrival BETWEEN ? AND ?', params[:start_date], params[:end_date]).sum(:male)


    $female = VisitorInfo.where('date_of_arrival BETWEEN ? AND ?', params[:start_date], params[:end_date]).sum(:female)

   	

         @chart8 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Gender")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Male visitors", :yAxis => 0, :data => [$male])
          f.series(:name => "Female visitors", :yAxis => 0, :data => [$female])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end



        $below18 = VisitorInfo.where('date_of_arrival BETWEEN ? AND ?', params[:start_date], params[:end_date]).sum(:Below_18)
        $age18_24 = VisitorInfo.where('date_of_arrival BETWEEN ? AND ?', params[:start_date], params[:end_date]).sum(:age18_24)
        $age25_34 = VisitorInfo.where('date_of_arrival BETWEEN ? AND ?', params[:start_date], params[:end_date]).sum(:age25_34)
        $age35_44 = VisitorInfo.where('date_of_arrival BETWEEN ? AND ?', params[:start_date], params[:end_date]).sum(:age35_44)
        $age45_54 = VisitorInfo.where('date_of_arrival BETWEEN ? AND ?', params[:start_date], params[:end_date]).sum(:age45_54)
        $age55_64 = VisitorInfo.where('date_of_arrival BETWEEN ? AND ?', params[:start_date], params[:end_date]).sum(:age55_64)
        $age65 = VisitorInfo.where('date_of_arrival BETWEEN ? AND ?', params[:start_date], params[:end_date]).sum(:age65)





        

	@chart9 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Age group")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Below 18", :yAxis => 0, :data => [$below18])
          f.series(:name => "18-24", :yAxis => 0, :data => [$age18_24])
          f.series(:name => "25-34", :yAxis => 0, :data => [$age25_34])
          f.series(:name => "35-44", :yAxis => 0, :data => [$age35_44])
          f.series(:name => "45-54", :yAxis => 0, :data => [$age45_54])
          f.series(:name => "55-64", :yAxis => 0, :data => [$age55_64])
          f.series(:name => "65 + above", :yAxis => 0, :data => [$age65])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end



        



      else


       $mos = Transport.where('user_id = ? AND trans = ?  AND rdate BETWEEN ? AND ?', params[:search], 'Personal car', params[:start_date], params[:end_date]).sum(:nump)


       $mos1 = Transport.where('user_id = ? AND trans = ?  AND rdate BETWEEN ? AND ?', params[:search], 'Rental car', params[:start_date], params[:end_date]).sum(:nump)

       $mos2 = Transport.where('user_id = ? AND trans = ?  AND rdate BETWEEN ? AND ?', params[:search], 'Tour bus', params[:start_date], params[:end_date]).sum(:nump)


       $mos3 = Transport.where('user_id = ? AND trans = ?  AND rdate BETWEEN ? AND ?', params[:search], 'School bus', params[:start_date], params[:end_date]).sum(:nump)


       $mos4 = Transport.where('user_id = ? AND trans = ?  AND rdate BETWEEN ? AND ?', params[:search], 'Motor bike', params[:start_date], params[:end_date]).sum(:nump)

       $mos5 = Transport.where('user_id = ? AND trans = ?  AND rdate BETWEEN ? AND ?', params[:search], 'Other', params[:start_date], params[:end_date]).sum(:nump)

        @chart64 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Mode of transport")
	  f.xAxis(:categories => ["Number of visitors"])
	  f.series(:name => "Personal car", :yAxis => 0, :data => [$mos])
	  f.series(:name => "Rental car", :yAxis => 0, :data => [$mos1])
          f.series(:name => "Tour bus", :yAxis => 0, :data => [$mos2])
          f.series(:name => "School bus", :yAxis => 0, :data => [$mos3])



          f.series(:name => "Motor bike", :yAxis => 0, :data => [$mos4])
          f.series(:name => "Other", :yAxis => 0, :data => [$mos5])
          


	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} }
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end

       #$pars = Partnership.where({partnership: 'Alone', user_id: current_user.id}).sum(:nump)

       $pars = Partnership.where('user_id = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', params[:search], 'Alone', params[:start_date], params[:end_date]).sum(:nump)
      

       

        $pars1 = Partnership.where('user_id = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', params[:search], 'With spouse/partner', params[:start_date], params[:end_date]).sum(:nump)
        

       



        $pars2 = Partnership.where('user_id = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', params[:search], 'With colleagues', params[:start_date], params[:end_date]).sum(:nump)
       
       

        $pars3 = Partnership.where('user_id = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', params[:search], 'With friends & relatives', params[:start_date], params[:end_date]).sum(:nump)
        
       

        $pars4 = Partnership.where('user_id = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', params[:search], 'With family', params[:start_date], params[:end_date]).sum(:nump)
        
        

        $pars5 = Partnership.where('user_id = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', params[:search], 'With children', params[:start_date], params[:end_date]).sum(:nump)
        

        

        $pars6 = Partnership.where('user_id = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', params[:search], 'Packaged tour', params[:start_date], params[:end_date]).sum(:nump)
       
        


        $pars7 = Partnership.where('user_id = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', params[:search], 'School tour', params[:start_date], params[:end_date]).sum(:nump)
        
        

        
        $pars8 = Partnership.where('user_id = ? AND partnership = ?  AND rdate BETWEEN ? AND ?', params[:search], 'Other', params[:start_date], params[:end_date]).sum(:nump )
        

       


         
      
      
         @chart63 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Travel partnership")
	  f.xAxis(:categories => ["Number of visitors"])
	  f.series(:name => "Alone", :yAxis => 0, :data => [$pars])
	  f.series(:name => "With spouse/partner", :yAxis => 0, :data => [$pars1])
          f.series(:name => "With colleagues", :yAxis => 0, :data => [$pars2])
          f.series(:name => "With friends & relatives", :yAxis => 0, :data => [$pars3])



          f.series(:name => "With family", :yAxis => 0, :data => [$pars4])
          f.series(:name => "With children", :yAxis => 0, :data => [$pars5])
          f.series(:name => "Packaged tour", :yAxis => 0, :data => [$pars6])
          f.series(:name => "School tour", :yAxis => 0, :data => [$pars7])
          f.series(:name => "Other", :yAxis => 0, :data => [$pars8])


	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} }
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end


        $reas = Reason.where('user_id = ? AND reason = ?  AND rdate BETWEEN ? AND ?', params[:search], 'Recreation/leisure', params[:start_date], params[:end_date]).sum(:nump)

        $reas2 = Reason.where('user_id = ? AND reason = ?  AND rdate BETWEEN ? AND ?', params[:search], 'Educational', params[:start_date], params[:end_date]).sum(:nump)

        $reas4 = Reason.where('user_id = ? AND reason = ?  AND rdate BETWEEN ? AND ?', params[:search], 'Research', params[:start_date], params[:end_date]).sum(:nump)

        $reas6 = Reason.where('user_id = ? AND reason = ?  AND rdate BETWEEN ? AND ?', params[:search], 'Other', params[:start_date], params[:end_date]).sum(:nump)

      

        @chart62 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Reasons for visit")
	  f.xAxis(:categories => ["Number of visitors"])
	  f.series(:name => "Recreation/leisure", :yAxis => 0, :data => [$reas])
	  f.series(:name => "Educational", :yAxis => 0, :data => [$reas2])
          f.series(:name => "Research", :yAxis => 0, :data => [$reas4])
          f.series(:name => "Other", :yAxis => 0, :data => [$reas6])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} }
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end
   
  

       @d = VisitorInfo.where('user_id = ? AND travel = ?  AND date_of_arrival BETWEEN ? AND ?', params[:search], 'individual', params[:start_date], params[:end_date]).sum(:male)

      @d1 = VisitorInfo.where('user_id = ? AND travel = ?  AND date_of_arrival BETWEEN ? AND ?', params[:search], 'individual', params[:start_date], params[:end_date]).sum(:female)

     $j = @d + @d1


     @d2 = VisitorInfo.where('user_id = ? AND travel = ?  AND date_of_arrival BETWEEN ? AND ?', params[:search], 'group', params[:start_date], params[:end_date]).sum(:female)

     @d12 = VisitorInfo.where('user_id = ? AND travel = ?  AND date_of_arrival BETWEEN ? AND ?', params[:search], 'group', params[:start_date], params[:end_date]).sum(:male)

     $k =  @d2 + @d12

  
       



        @chart7 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Type of visitors")
	  f.xAxis(:categories => ["Number of visitors"])
	  f.series(:name => "Individual", :yAxis => 0, :data => [$j])
	  f.series(:name => "Group", :yAxis => 0, :data => [$k])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} }
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end

        


    $male = VisitorInfo.where('user_id = ? AND date_of_arrival BETWEEN ? AND ?', params[:search], params[:start_date], params[:end_date]).sum(:male)


    $female = VisitorInfo.where('user_id = ? AND date_of_arrival BETWEEN ? AND ?', params[:search], params[:start_date], params[:end_date]).sum(:female)

   	

         @chart8 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Gender")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Male visitors", :yAxis => 0, :data => [$male])
          f.series(:name => "Female visitors", :yAxis => 0, :data => [$female])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end



        $below18 = VisitorInfo.where('user_id = ? AND date_of_arrival BETWEEN ? AND ?', params[:search], params[:start_date], params[:end_date]).sum(:Below_18)
        $age18_24 = VisitorInfo.where('user_id = ? AND date_of_arrival BETWEEN ? AND ?', params[:search], params[:start_date], params[:end_date]).sum(:age18_24)
        $age25_34 = VisitorInfo.where('user_id = ? AND date_of_arrival BETWEEN ? AND ?', params[:search], params[:start_date], params[:end_date]).sum(:age25_34)
        $age35_44 = VisitorInfo.where('user_id = ? AND date_of_arrival BETWEEN ? AND ?', params[:search], params[:start_date], params[:end_date]).sum(:age35_44)
        $age45_54 = VisitorInfo.where('user_id = ? AND date_of_arrival BETWEEN ? AND ?', params[:search], params[:start_date], params[:end_date]).sum(:age45_54)
        $age55_64 = VisitorInfo.where('user_id = ? AND date_of_arrival BETWEEN ? AND ?', params[:search], params[:start_date], params[:end_date]).sum(:age55_64)
        $age65 = VisitorInfo.where('user_id = ? AND date_of_arrival BETWEEN ? AND ?', params[:search], params[:start_date], params[:end_date]).sum(:age65)





        

	@chart9 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Age group")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Below 18", :yAxis => 0, :data => [$below18])
          f.series(:name => "18-24", :yAxis => 0, :data => [$age18_24])
          f.series(:name => "25-34", :yAxis => 0, :data => [$age25_34])
          f.series(:name => "35-44", :yAxis => 0, :data => [$age35_44])
          f.series(:name => "45-54", :yAxis => 0, :data => [$age45_54])
          f.series(:name => "55-64", :yAxis => 0, :data => [$age55_64])
          f.series(:name => "65 + above", :yAxis => 0, :data => [$age65])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end

    end

end

end
