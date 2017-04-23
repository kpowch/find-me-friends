import React from'react';

class Chatbar extends React.Component {

  render() {
    return (
      <footer className="chatbar">
        <input className="chatbar-username" placeholder="Username" />
        <input className="chatbar-message" onKeyPress={this.props.addChatMessage} placeholder="Message" />
      </footer>
    );
  }
}
export default Chatbar;