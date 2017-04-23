import React from'react';

class ChatBar extends React.Component {

  render() {
    return (
      <footer className="chatbar">
        <input className="chatbar-username" placeholder="Username" />
        <input className="chatbar-message" onKeyPress={this.props.addChatMessage} placeholder="Message" />
      </footer>
    );
  }
}
export default ChatBar;