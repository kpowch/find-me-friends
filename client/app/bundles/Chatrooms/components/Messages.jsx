import React from'react';

class Messages extends React.Component {
  render() {
    return (
      <main className="messages">
        <span>{this.props.name}</span>
        <span className="message-content">{this.props.message.content}</span>
      </main>
    );
  }
}
export default Messages;
