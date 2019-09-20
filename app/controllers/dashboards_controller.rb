class DashboardsController < ApplicationController

	def index


      $zzz = current_user.id
      
       

       #$mos = Transport.where({trans: 'Personal car', user_id: current_user.id}).sum(:nump)
       $mos = Transport.where('trans = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'Personal car',  $zzz, params[:start_date], params[:end_date]).sum(:nump)

       #$mos1 = Transport.where({trans: 'Rental car', user_id: current_user.id}).sum(:nump)
       $mos1 = Transport.where('trans = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'Rental car',  $zzz, params[:start_date], params[:end_date]).sum(:nump)

       #$mos2 = Transport.where({trans: 'Tour bus', user_id: current_user.id}).sum(:nump)
       $mos2 = Transport.where('trans = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'Tour bus',  $zzz, params[:start_date], params[:end_date]).sum(:nump)


       #$mos3 = Transport.where({trans: 'School bus', user_id: current_user.id}).sum(:nump)
       $mos3 = Transport.where('trans = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'School bus',  $zzz, params[:start_date], params[:end_date]).sum(:nump)

       #$mos4 = Transport.where({trans: 'Motor bike', user_id: current_user.id}).sum(:nump)
       $mos4 = Transport.where('trans = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'Motor bike',  $zzz, params[:start_date], params[:end_date]).sum(:nump)

       #$mos5 = Transport.where({trans: 'Other', user_id: current_user.id}).sum(:nump)
       $mos5 = Transport.where('trans = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'Other',  $zzz, params[:start_date], params[:end_date]).sum(:nump)

        @chart67 = LazyHighCharts::HighChart.new('graph') do |f|
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






      #@par = VisitorInfo.where({partner: 'Alone', user_id: current_user.id}).sum(:male)
       # @par1 = VisitorInfo.where({partner: 'Alone', user_id: current_user.id}).sum(:female)


         $reas = Reason.where('reason = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'Recreation/leisure',  $zzz, params[:start_date], params[:end_date]).sum(:nump)

        

         #$pars = Partnership.where({partnership: 'Alone', user_id: current_user.id}).sum(:nump)


        $pars = Partnership.where('partnership = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'Alone',  $zzz, params[:start_date], params[:end_date]).sum(:nump)

        #$pars1 = Partnership.where({partnership: 'With spouse/partner', user_id: current_user.id}).sum(:nump)

	$pars1 = Partnership.where('partnership = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'With spouse/partner',  $zzz, params[:start_date], params[:end_date]).sum(:nump)

        #$pars2 = Partnership.where({partnership: 'With colleagues', user_id: current_user.id}).sum(:nump)

        $pars2 = Partnership.where('partnership = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'With colleagues',  $zzz, params[:start_date], params[:end_date]).sum(:nump)
        
        
        
        #$pars3 = Partnership.where({partnership: 'With friends & relatives', user_id: current_user.id}).sum(:nump)

        $pars3 = Partnership.where('partnership = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'With friends & relatives',  $zzz, params[:start_date], params[:end_date]).sum(:nump)
        

        
        #$pars4 = Partnership.where({partnership: 'With family', user_id: current_user.id}).sum(:nump)

        $pars4 = Partnership.where('partnership = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'With family',  $zzz, params[:start_date], params[:end_date]).sum(:nump)

       
        #$pars5 = Partnership.where({partnership: 'With children', user_id: current_user.id}).sum(:nump)

        $pars5 = Partnership.where('partnership = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'With children',  $zzz, params[:start_date], params[:end_date]).sum(:nump)

        
        #$pars6 = Partnership.where({partnership: 'Packaged tour', user_id: current_user.id}).sum(:nump)

        $pars6 = Partnership.where('partnership = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'Packaged tour',  $zzz, params[:start_date], params[:end_date]).sum(:nump)


        #$pars7 = Partnership.where({partnership: 'School tour', user_id: current_user.id}).sum(:nump)

        $pars7 = Partnership.where('partnership = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'School tour',  $zzz, params[:start_date], params[:end_date]).sum(:nump)


        #$pars8 = Partnership.where({partnership: 'Other', user_id: current_user.id}).sum(:nump)

        $pars8 = Partnership.where('partnership = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'Other',  $zzz, params[:start_date], params[:end_date]).sum(:nump)

      
      
         @chart66 = LazyHighCharts::HighChart.new('graph') do |f|
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


       

        $reas = Reason.where('reason = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'Recreation/leisure',  $zzz, params[:start_date], params[:end_date]).sum(:nump)
       

        $reas2 = Reason.where('reason = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'Educational',  $zzz, params[:start_date], params[:end_date]).sum(:nump)
        

        $reas4 = Reason.where('reason = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'Research',  $zzz, params[:start_date], params[:end_date]).sum(:nump)
        

        $reas6 = Reason.where('reason = ? AND user_id = ? AND rdate BETWEEN ? AND ?', 'Other',  $zzz, params[:start_date], params[:end_date]).sum(:nump)
        
      


        @chart65 = LazyHighCharts::HighChart.new('graph') do |f|
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




       $mos = Transport.where(:trans => 'Personal car').sum(:nump)

       $mos1 = Transport.where(:trans => 'Rental car').sum(:nump)

       $mos2 = Transport.where(:trans => 'Tour bus').sum(:nump)

       $mos3 = Transport.where(:trans => 'School bus').sum(:nump)

       $mos4 = Transport.where(:trans => 'Motor bike').sum(:nump)

       $mos5 = Transport.where(:trans => 'Other').sum(:nump)

        @chart61 = LazyHighCharts::HighChart.new('graph') do |f|
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






        

         $pars = Partnership.where(:partnership => 'Alone').sum(:nump)


        $pars1 = Partnership.where(:partnership => 'With spouse/partner').sum(:nump)

        $pars2 = Partnership.where(:partnership => 'With colleagues').sum(:nump)
        
        
        
        $pars3 = Partnership.where(:partnership => 'With friends & relatives').sum(:nump)

        
        $pars4 = Partnership.where(:partnership => 'With family').sum(:nump)

       
        $pars5 = Partnership.where(:partnership => 'With children').sum(:nump)

        
        $pars6 = Partnership.where(:partnership => 'Packaged tour').sum(:nump)


        $pars7 = Partnership.where(:partnership => 'School tour').sum(:nump)


        $pars8 = Partnership.where(:partnership => 'Other').sum(:nump)






      
      
         @chart60 = LazyHighCharts::HighChart.new('graph') do |f|
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
       

        $reas = Reason.where(:reason => 'Recreation/leisure').sum(:nump)
        
        $reas2 = Reason.where(:reason => 'Educational').sum(:nump)
        
        $reas4 = Reason.where(:reason => 'Research').sum(:nump)
        
        $reas6 = Reason.where(:reason => 'Other').sum(:nump)
        


        @chart50 = LazyHighCharts::HighChart.new('graph') do |f|
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
       


    
        
       
        @visitor_infos = VisitorInfo.all

        @u = VisitorInfo.where(:user_id => current_user.id)


        @establishment = Establishment.where(:id => current_user.establishment_id)



        @in = VisitorInfo.where(:travel => 'individual').sum(:male)
        @in1 = VisitorInfo.where(:travel => 'individual').sum(:female)

        $y = @in + @in1

        @gro = VisitorInfo.where(:travel => 'group').sum(:male)
        @gro1 = VisitorInfo.where(:travel => 'group').sum(:female)
    
        $z = @gro + @gro1 

        @chart = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Type of visitors")
	  f.xAxis(:categories => ["Number of visitors"])
	  f.series(:name => "Individual", :yAxis => 0, :data => [$y])
	  f.series(:name => "Group", :yAxis => 0, :data => [$z])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} }
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end


@visitor_infos = VisitorInfo.where({date_of_arrival: (params[:start_date]).. (params[:end_date])} || {travel: params[:travel] }).paginate(:page => params[:page], :per_page => 50)


        #@d = VisitorInfo.where({travel: 'individual', user_id: current_user.id}).sum(:male)
        #@d1 = VisitorInfo.where({travel: 'individual', user_id: current_user.id}).sum(:female)


	@d = VisitorInfo.where('travel = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Individual', $zzz, params[:start_date], params[:end_date]).sum(:male)
        @d1 = VisitorInfo.where('travel = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'Individual', $zzz, params[:start_date], params[:end_date]).sum(:female)




        $j = @d + @d1


         #@d2 = VisitorInfo.where({travel: 'group', user_id: current_user.id}).sum(:male)
        #@d12 = VisitorInfo.where({travel: 'group', user_id: current_user.id}).sum(:female)
    
        @d2 = VisitorInfo.where('travel = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'group', $zzz, params[:start_date], params[:end_date]).sum(:male)
        @d12 = VisitorInfo.where('travel = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'group', $zzz, params[:start_date], params[:end_date]).sum(:female)

        $k =  @d2 + @d12



        @chart6 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Type of visitors")
	  f.xAxis(:categories => ["Visitors"])
	  f.series(:name => "Individual", :yAxis => 0, :data => [$j])
	  f.series(:name => "Group", :yAxis => 0, :data => [$k])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} }
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end

        $a1 = VisitorInfo.sum(:Below_18)
        $a2 = VisitorInfo.sum(:age18_24)
        $a3 = VisitorInfo.sum(:age25_34)
        $a4 = VisitorInfo.sum(:age35_44)
        $a5 = VisitorInfo.sum(:age45_54)
        $a6 = VisitorInfo.sum(:age55_64)
        $a7 = VisitorInfo.sum(:age65)


        @chart1 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Age group")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Below 18", :yAxis => 0, :data => [$a1])
          f.series(:name => "18-24", :yAxis => 0, :data => [$a2])
          f.series(:name => "25-34", :yAxis => 0, :data => [$a3])
          f.series(:name => "35-44", :yAxis => 0, :data => [$a4])
          f.series(:name => "45-54", :yAxis => 0, :data => [$a5])
          f.series(:name => "55-64", :yAxis => 0, :data => [$a6])
          f.series(:name => "65 + above", :yAxis => 0, :data => [$a7])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end

        $a = VisitorInfo.sum(:male)
        $b = VisitorInfo.sum(:female)
        @chart2 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Gender")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Male visitors", :yAxis => 0, :data => [VisitorInfo.sum(:male)])
          f.series(:name => "Female visitors", :yAxis => 0, :data => [VisitorInfo.sum(:female)])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end

        $V = InternationalVisitorInfor.sum(:africa)
        $tt = VisitorInfo.where('citizenship = ? ', 'Swazi').sum(:female)
        $tt1 = VisitorInfo.where('citizenship = ? ', 'Swazi').sum(:male)
  
               


        $jk = $V + $tt + $tt1
        $gg = InternationalVisitorInfor.sum(:asia)
        $gg1 = InternationalVisitorInfor.sum(:america)
        $gg2 = InternationalVisitorInfor.sum(:europe)
        

        @chart3 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Arrival by world regions")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Africa", :yAxis => 0, :data => [$jk])
          f.series(:name => "Asia", :yAxis => 0, :data => [$gg])
          f.series(:name => "America", :yAxis => 0, :data => [$gg1])
          f.series(:name => "Europe", :yAxis => 0, :data => [$gg2])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end




         $fff = current_user.id
         

         #$V = InternationalVisitorInfor.where({user_id: current_user.id}).sum(:africa)

         $V = InternationalVisitorInfor.where('user_id = ?  AND rdate BETWEEN ? AND ?', $fff, params[:start_date], params[:end_date]).sum(:africa)

         
      
        #$ttt = VisitorInfo.where('citizenship = ? and user_id = ? ', 'Swazi', $fff).sum(:female)
        #$tt11 = VisitorInfo.where('citizenship = ? and user_id = ? ', 'Swazi', $fff).sum(:male)  


        $ttt = VisitorInfo.where('citizenship = ? and user_id = ? AND date_of_arrival BETWEEN ? AND ?', 'Swazi', $fff, params[:start_date], params[:end_date]).sum(:female)
        $tt11 = VisitorInfo.where('citizenship = ? and user_id = ? AND date_of_arrival BETWEEN ? AND ?', 'Swazi', $fff, params[:start_date], params[:end_date]).sum(:male)     


        $jk = $V + $ttt + $tt11
  
        $gg = InternationalVisitorInfor.where('user_id = ?  AND rdate BETWEEN ? AND ?', $fff, params[:start_date], params[:end_date]).sum(:asia)
        $gg1 = InternationalVisitorInfor.where('user_id = ?  AND rdate BETWEEN ? AND ?', $fff, params[:start_date], params[:end_date]).sum(:america)
        $gg2 = InternationalVisitorInfor.where('user_id = ?  AND rdate BETWEEN ? AND ?', $fff, params[:start_date], params[:end_date]).sum(:europe)
        

        @chart311 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Arrival by world regions")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Africa", :yAxis => 0, :data => [$jk])
          f.series(:name => "Asia", :yAxis => 0, :data => [$gg])
          f.series(:name => "America", :yAxis => 0, :data => [$gg1])
          f.series(:name => "Europe", :yAxis => 0, :data => [$gg2])
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end


         #@d12 = VisitorInfo.where('travel = ? AND user_id = ?  AND date_of_arrival BETWEEN ? AND ?', 'group', $zzz, params[:start_date], params[:end_date]).sum(:female)


         $male = VisitorInfo.where('user_id = ?  AND date_of_arrival BETWEEN ? AND ?', $zzz, params[:start_date], params[:end_date]).sum(:male)
         $female = VisitorInfo.where('user_id = ?  AND date_of_arrival BETWEEN ? AND ?', $zzz, params[:start_date], params[:end_date]).sum(:female)

         @chart4 = LazyHighCharts::HighChart.new('graph') do |f|
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

        $below18 = VisitorInfo.where('user_id = ?  AND date_of_arrival BETWEEN ? AND ?', $zzz, params[:start_date], params[:end_date]).sum(:Below_18)
        $age18_24 = VisitorInfo.where('user_id = ?  AND date_of_arrival BETWEEN ? AND ?', $zzz, params[:start_date], params[:end_date]).sum(:age18_24)
        $age25_34 = VisitorInfo.where('user_id = ?  AND date_of_arrival BETWEEN ? AND ?', $zzz, params[:start_date], params[:end_date]).sum(:age25_34)
        $age35_44 = VisitorInfo.where('user_id = ?  AND date_of_arrival BETWEEN ? AND ?', $zzz, params[:start_date], params[:end_date]).sum(:age35_44)
        $age45_54 = VisitorInfo.where('user_id = ?  AND date_of_arrival BETWEEN ? AND ?', $zzz, params[:start_date], params[:end_date]).sum(:age45_54)
        $age55_64 = VisitorInfo.where('user_id = ?  AND date_of_arrival BETWEEN ? AND ?', $zzz, params[:start_date], params[:end_date]).sum(:age55_64)
        $age65 = VisitorInfo.where('user_id = ?  AND date_of_arrival BETWEEN ? AND ?', $zzz, params[:start_date], params[:end_date]).sum(:age65)


	@chart5 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Age group")
	  f.xAxis(:categories => ["Age group"])
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





        $d22 = Country.where({name: 'Swaziland'}).sum(:num_v)
        $d23 = Country.where({name: 'South Africa'}).sum(:num_v)
        $d24 = Country.where({name: 'Mozambique'}).sum(:num_v)
        $d25 = Country.where({name: 'Botswana'}).sum(:num_v)
        $d26 = Country.where({name: 'Lesotho'}).sum(:num_v)
        $d27 = Country.where({name: 'Germany'}).sum(:num_v)
        $d28 = Country.where({name: 'Netherlands'}).sum(:num_v)
        $d29 = Country.where({name: 'United Kingdom'}).sum(:num_v)
        $d30 = Country.where({name: 'France'}).sum(:num_v)
        $d31 = Country.where({name: 'Potugal'}).sum(:num_v)
        $d32 = Country.where({name: 'Switzerland'}).sum(:num_v)
        $d33 = Country.where({name: 'Australia'}).sum(:num_v)
        $d34 = Country.where({name: 'New Zealand'}).sum(:num_v)
        $d35 = Country.where({name: 'China'}).sum(:num_v)
        $d36 = Country.where({name: 'India'}).sum(:num_v)
        $d37 = Country.where({name: 'Taiwan'}).sum(:num_v)
        $d38 = Country.where({name: 'United States'}).sum(:num_v)
        $d39 = Country.where({name: 'Canada'}).sum(:num_v)
        $d40 = Country.where({name: 'Mexico'}).sum(:num_v)
        $d41 = Country.where({name: 'Russia'}).sum(:num_v)
        $d42 = Country.where({name: 'Angola'}).sum(:num_v)
        $d43 = Country.where({name: 'Brazil'}).sum(:num_v)
        $d44 = Country.where({name: 'Japan'}).sum(:num_v)
        $d45 = Country.where({name: 'United Arab Emirates'}).sum(:num_v)
        $d46 = Country.where({name: 'Argentina'}).sum(:num_v)
        $d47 = Country.where({name: 'Afghanistan'}).sum(:num_v)
        $d48 = Country.where({name: 'Zambia'}).sum(:num_v)
        $d49 = Country.where({name: 'Zimbabwe'}).sum(:num_v)
       
        
        

        @chart55 = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Arrival by country")
	  f.xAxis(:categories => ["Number of visitors"])
          f.series(:name => "Swaziland", :yAxis => 0, :data => [$d22])
          f.series(:name => "South Africa", :yAxis => 0, :data => [$d23])
          f.series(:name => "Mozambique", :yAxis => 0, :data => [$d24])
          f.series(:name => "Botswana", :yAxis => 0, :data => [$d25])
          f.series(:name => "Lesotho", :yAxis => 0, :data => [$d26])
          f.series(:name => "Germany", :yAxis => 0, :data => [$d27])
          f.series(:name => "Netherlands", :yAxis => 0, :data => [$d28])
          f.series(:name => "United Kingdom", :yAxis => 0, :data => [$d29])
          f.series(:name => "France", :yAxis => 0, :data => [$d30])
          f.series(:name => "Portugal", :yAxis => 0, :data => [$d31])
          f.series(:name => "Switzerland", :yAxis => 0, :data => [$d32])
          f.series(:name => "Australia", :yAxis => 0, :data => [$d33])
          f.series(:name => "New Zealand", :yAxis => 0, :data => [$d34])
          f.series(:name => "China", :yAxis => 0, :data => [$d35])
          f.series(:name => "India", :yAxis => 0, :data => [$d36])
          f.series(:name => "Taiwan", :yAxis => 0, :data => [$d37])
          f.series(:name => "United States", :yAxis => 0, :data => [$d38])
          f.series(:name => "Canada", :yAxis => 0, :data => [$d39])
          f.series(:name => "Mexico", :yAxis => 0, :data => [$d40])
          f.series(:name => "Russia", :yAxis => 0, :data => [$d41])
          f.series(:name => "Angola", :yAxis => 0, :data => [$d42])
          f.series(:name => "Brazil", :yAxis => 0, :data => [$d43])
          f.series(:name => "Japan", :yAxis => 0, :data => [$d44])
          f.series(:name => "United Arab Emirates", :yAxis => 0, :data => [$d45])
          f.series(:name => "Argentina", :yAxis => 0, :data => [$d46])
          f.series(:name => "Afghanistan", :yAxis => 0, :data => [$d47])
          f.series(:name => "Zambia", :yAxis => 0, :data => [$d48])
          f.series(:name => "Zimbabwe", :yAxis => 0, :data => [$d49])
          
	  f.yAxis [
	    {:title => {:text => "Figures", :margin => 70} },
	    
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end

        
	end

       

end
