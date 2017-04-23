import React from'react';

class Messages extends React.Component {
  render() {
    return (
      <main className="messages">
          <span className="message-username">{this.props.username}</span>
          <span className="message-content">{this.props.content}</span>
      </main>
    );
  }
}
export default Messages;
