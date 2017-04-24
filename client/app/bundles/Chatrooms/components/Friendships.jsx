import React from'react';

class Friendships extends React.Component {
  render() {
    return (
      <main className='friendship-sidebar'>
        <div>{this.props.friend}
        </div>
      </main>
    );
  }
}
export default Friendships;
