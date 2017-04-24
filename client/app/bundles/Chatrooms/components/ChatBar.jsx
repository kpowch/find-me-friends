import React from'react';

class Chatbar extends React.Component {

  render() {
    return (
      <div className="chatbar">
        {this.props.currentUser}
        <input className="chatbar-message" onKeyPress={this.props.addChatMessage} placeholder="Message" />
      </div>
    );
  }
}
export default Chatbar;