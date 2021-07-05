class BadgeSubmission
  NODE = Rails.application.credentials.chainpoint[:node]

  def proof_id_from(hash)
    response = request(hash)

    JSON.parse(response)['hashes'][0]['proof_id']
  rescue StandardError
    raise ChainpointError.new('Error Submitting your badge. Please verify the data you entered')
  end

  def request(hash)
    `curl -s -X POST http://#{NODE}/hashes -H 'Accept: application/json' -H 'Content-Type: application/json' -d '{"hashes": ["#{hash}"]}'`
  end
end