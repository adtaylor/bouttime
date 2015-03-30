cx = React.addons.classSet
exports = exports ? this
exports.SkaterPenalties = React.createClass
  displayName: 'SkaterPenalties'
  propTypes:
    skaterState: React.PropTypes.object.isRequired
    actions: React.PropTypes.object.isRequired
    teamStyle: React.PropTypes.object
    hidden: React.PropTypes.bool
    backHandler: React.PropTypes.func.isRequired
    editHandler: React.PropTypes.func.isRequired
  bindActions: (penaltyIndex) ->
    Object.keys(@props.actions).map((key) ->
      key: key
      value: @props.actions[key].bind(this, penaltyIndex)
    , this).reduce((actions, action) ->
      actions[action.key] = action.value
      actions
    , {})
  getPenaltyId: (penaltyIndex) ->
    "edit-penalty-#{@props.skaterState.id}-#{penaltyIndex}"
  render: () ->
    containerClass = cx
      'skater-penalties': true
      'hidden': @props.hidden
    <div className={containerClass}>
      <div className='row gutters-xs top-buffer actions' >
        <div className='col-sm-12 col-xs-12'>
          <button className='bt-btn btn-boxed action' onClick={@props.backHandler} >
            <span className='icon glyphicon glyphicon-chevron-left'></span><strong>Back</strong>
          </button>
        </div>
      </div>
      <div className='row gutters-xs top-buffer'>
        <div className='col-sm-2 col-xs-2'>
          <div className='bt-btn btn-boxed' style={@props.teamStyle}>
            <strong>{@props.skaterState.skater.number}</strong>
          </div>
        </div>
      </div>
      <div className='row gutters-xs top-buffer penalty-controls'>
        <div className='col-xs-10 col-sm-10'>
          <div className='row gutters-xs'>
            <div className='col-xs-2 col-sm-2'>
              <PenaltyControl
                penaltyNumber={1}
                penaltyState={@props.skaterState.penaltyStates[0]}
                teamStyle={@props.teamStyle}
                target={@getPenaltyId(0)} />
            </div>
            <div className='col-xs-2 col-sm-2'>
              <PenaltyControl
                penaltyNumber={2}
                penaltyState={@props.skaterState.penaltyStates[1]}
                teamStyle={@props.teamStyle}
                target={@getPenaltyId(1)} />
            </div>
            <div className='col-xs-2 col-sm-2'>
              <PenaltyControl
                penaltyNumber={3}
                penaltyState={@props.skaterState.penaltyStates[2]}
                teamStyle={@props.teamStyle}
                target={@getPenaltyId(2)} />
            </div>
            <div className='col-xs-2 col-sm-2'>
              <PenaltyControl
                penaltyNumber={4}
                penaltyState={@props.skaterState.penaltyStates[3]}
                teamStyle={@props.teamStyle}
                target={@getPenaltyId(3)}/>
            </div>
            <div className='col-xs-2 col-sm-2'>
              <PenaltyControl
                penaltyNumber={5}
                penaltyState={@props.skaterState.penaltyStates[4]}
                teamStyle={@props.teamStyle}
                target={@getPenaltyId(4)} />
            </div>
            <div className='col-xs-2 col-sm-2'>
              <PenaltyControl
                penaltyNumber={6}
                penaltyState={@props.skaterState.penaltyStates[5]}
                teamStyle={@props.teamStyle}
                target={@getPenaltyId(5)} />
            </div>
          </div>
        </div>
        <div className='col-xs-2 col-sm-2'>
          <div className='penalty-7'>
            <PenaltyControl
              penaltyNumber={7}
              penaltyState={@props.skaterState.penaltyStates[6]}
              teamStyle={@props.teamStyle}
              target={@getPenaltyId(6)} />
          </div>
        </div>
      </div>
      <div className='row gutters-xs'>
        <div className='col-xs-12'>
          {@props.skaterState.penaltyStates.map (penaltyState, penaltyIndex) ->
            <EditPenaltyPanel
              key={penaltyIndex}
              id={@getPenaltyId(penaltyIndex)}
              penaltyState={penaltyState}
              penaltyNumber={penaltyIndex+1}
              actions={@bindActions(penaltyIndex)}
              onOpen={@props.editHandler.bind(null, penaltyIndex)}
              onClose={@props.editHandler.bind(null, null)}/>
          , this}
        </div>
      </div>
    </div>