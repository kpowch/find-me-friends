import PropTypes from 'prop-types';
import React from 'react';

import Chatbar from './Chatbar.jsx';
import Messages from './Messages.jsx';
import Friendships from './Friendships.jsx';

export default class Chatrooms extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };


  constructor(props, _railsContext) {
    super(props);

    this.state = {
      name: this.props.name,
      messages: this.props.messages,
      friendships: this.props.friendships
    };

  }

  render() {
    return (
    <div className='chatroom'>

      <div className='sidebar'>
        {this.state.messages.map((message) =>
            <Messages key={message.key} username={this.props.name} content={message.content}  />
          )}
      </div>
      <div>
        <Chatbar currentUser={this.state.name} />
      </div>
    </div>

    )
  }
}
