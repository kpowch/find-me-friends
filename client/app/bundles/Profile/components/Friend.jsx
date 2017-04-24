import React from 'react';
import ReactDOM from 'react-dom';

class Friend extends React.Component {

  render() {
    return (
      <div className="friend">
        <h2>Your new friend</h2>
        <div>
          {this.props.name}
        </div>
      </div>
    );
  }
}

export default Friend;