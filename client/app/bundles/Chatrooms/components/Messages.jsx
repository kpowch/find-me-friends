import React from'react';

class Messages extends React.Component {
  render() {
    return (
      <main className="messages">
          <span className="message-content">{this.props.message}</span>
      </main>
    );
  }
}
export default Messages;
