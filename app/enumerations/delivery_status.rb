class DeliveryStatus < EnumerateIt::Base
  associate_values(
    delivered: 0,
    not_yet_loaded: 1,
    on_transit: 2,
    unloaded: 3,
    waiting_for_client: 4,
    in_logistics: 5,
    with_hired_carrier: 6
  )

  sort_by :none
end
