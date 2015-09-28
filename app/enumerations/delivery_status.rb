class DeliveryStatus < EnumerateIt::Base
  associate_values(
    not_yet_loaded: 1,
    on_transit: 2,
    unloaded: 3,
    waiting_for_client: 4,
    delivered: 5,
    in_logistics: 6,
    with_hired_carrier: 7
  )

  sort_by :none
end