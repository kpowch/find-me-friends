import PropTypes from 'prop-types';
import React from 'react';

import Friendships from './Friendships.jsx';

export default class Chatrooms extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  constructor(props, _railsContext) {
    super(props);

    this.state = {
      name: this.props.name,
      friendships: this.props.friends
    };

  }

  render() {
    return (
    <div className='chatroomz'>
      <div className='sidebarz'>
        {this.state.friendships.map((friend, index) =>
        <Friendships key={index} friend={friend} />
        )}
      </div>
    </div>
    )
  }
}

//   <div className='messagez'>
//   {this.state.messages.map((message, index) =>
//   <Messages key={index} message={message} name={name} />
//   )}
// </div>