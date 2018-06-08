chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'lulz', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/lulz')(@robot)

  describe 'defaults', ->
    it 'registers a respond listener', ->
      expect(@robot.respond).to.have.been.calledWith(/hello/)

    it 'registers a hear listener', ->
      expect(@robot.hear).to.have.been.calledWith(/orly/)

  describe 'a lol', ->
    it 'should send a lol when it sees a lol', ->
      expect