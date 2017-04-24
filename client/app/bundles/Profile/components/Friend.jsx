import React from 'react';
import ReactDOM from 'react-dom';

class Friend extends React.Component {

  render() {
    return (
      <main>
        <h2>Your new friend</h2>
        <div className="friend">
          {this.props.name}
        </div>
      </main>
    );
  }
}

export default Friend;