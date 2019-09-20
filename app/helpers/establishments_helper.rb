module EstablishmentsHelper

def popupmsg_customize_link (title, msgbody, path, buttontype="btn btn-xs btn-danger")
    link_to 'Delete', path,
      :method => :delete,
      :class => buttontype,
      :data => { :confirm => t('.confirm.body', :default => msgbody),
        "confirm-title" => t('.confirm.title', :default => title),
        "confirm-fade" => true,
        "confirm-cancel" => t('.confirm.cancel', :default => 'Cancel'),
        "confirm-cancel-class" => "btn-cancel",
        "confirm-proceed" => t('.confirm.proceed', :default => 'Continue'),
        "confirm-proceed-class" => "btn-danger"}

  end


end

