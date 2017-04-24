import PropTypes from 'prop-types';
import React from 'react';

import Chatbar from './Chatbar.jsx';
import Messages from './Messages.jsx';

export default class Chatrooms extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  /**
   * @param props - Comes from your rails view.
   * @param _railsContext - Comes from React on Rails
   */
  constructor(props, _railsContext) {
    super(props);

    this.state = {
      name: this.props.name,
      messages: this.props.messages,
      friendships: this.props.friendships
    };
    // this.state = { name: this.props.name }; FROM HELLO WORLD EXAMPLE
  }

  render() {
    return (
    <div className='chatroom'>
      {this.state.name}
      <div className='sidebar'>
        <Messages />

      </div>
      <div>
        <Chatbar currentUser={this.state.name} />
      </div>
    </div>

    )
  }
}
